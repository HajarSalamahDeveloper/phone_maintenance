import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_maintenance/features/services/repository/repositry_services.dart';
import 'package:phone_maintenance/services_network/app_dataBase.dart';

import 'app_rout/app_rout_management.dart';
import 'core/share/navigator_service.dart';
import 'core/share/themes_manager.dart';
import 'features/services/bloc/_service_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;

  MyApp({required this.database});
  @override
  Widget build(BuildContext context) {
    ServicesRepositoryImp repositoryImp =
        ServicesRepositoryImp(database: database);
    return MultiBlocProvider(
        providers: [
          BlocProvider<ServiceBloc>(
            create: (context) =>
                ServiceBloc(repository: repositoryImp)..add(FetchServices()),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                title: 'MobilyDoctor',
                theme: MyAppThemes.lightTheme,
                darkTheme: MyAppThemes.darkTheme,
                debugShowCheckedModeBanner: false,
                navigatorKey: NavigatorService.navigatorKey,
                onGenerateRoute: AppRoutes.generateRoute,
              );
            }));
  }
}
