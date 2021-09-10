import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pan_do/core/init/cache/locale_manager.dart';
import 'package:pan_do/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  BuildContext? context;

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigationService = NavigationService.instance;
  Dio dio = Dio();

  void setContext(BuildContext context);
  void init();
}
