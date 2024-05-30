import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_maintenance/core/share/app_screen.dart';
import 'package:phone_maintenance/core/share/text_widget.dart';
import 'package:phone_maintenance/features/services/screens/service_details.dart';

import '../../post_requsts/screen/maintanince_screen.dart';
import '../bloc/_service_bloc.dart';

class ServiceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaintenanceRequestScreen(),
                  ),
                );
              },
              icon: Icon(Icons.add))
        ],
        title: TextWidget(
          'الرئيسية',
          textDirection: TextDirection.rtl,
        ),
      ),
      child: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          if (state is ServiceLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ServiceLoaded) {
            return ListView.builder(
              itemCount: state.services.length,
              itemBuilder: (context, index) {
                final service = state.services[index];
                return ListTile(
                  title: Text(service.name!),
                  subtitle: Text(service.description!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ServiceDetailScreen(service: service),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is ServiceError) {
            return Center(child: Text('فشل في التحميل: ${state.message}'));
          }
          return Center(child: Text('لا يوجد اي خدمة متاحة'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ServiceBloc>().add(FetchServices()),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
