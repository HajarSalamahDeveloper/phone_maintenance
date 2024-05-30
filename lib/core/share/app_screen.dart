import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manger.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    this.child,
    this.statusBarColor,
    this.scaffoldBackgroundColor,
    this.floatingActionButton,
    this.implySafeAreaTopPadding = false,
    this.bottomNavigationBar,
    this.appBar,
    this.isAppBar = true,
  });
  final Widget? child;
  final Color? statusBarColor;
  final Color? scaffoldBackgroundColor;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool implySafeAreaTopPadding;
  final PreferredSizeWidget? appBar;
  final bool? isAppBar;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor ?? Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldBackgroundColor ?? AppColor.backgroundcolor,
        body: SafeArea(
          top: implySafeAreaTopPadding,
          child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: child),
        ),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
