import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:milkshake_practise/business_logic/view_model/appsite_theme_viewmodel.dart';
import 'package:milkshake_practise/business_logic/view_model/brand_name_screen_viewmodel.dart';
import 'package:milkshake_practise/business_logic/view_model/login_screen_viewmodel.dart';
import 'package:milkshake_practise/business_logic/view_model/url_screen_viewmodel.dart';

import '../business_logic/view_model/brand_image_screen_viewmodel.dart';

GetIt serviceLocator = GetIt.I;
void setUpServiceLocator() {
  serviceLocator.registerLazySingleton(() => ImagePicker());
  serviceLocator.registerFactory(() => LoginScreenViewModel());
  serviceLocator.registerFactory(() => BrandNameScreenViewModel());
  serviceLocator.registerFactory(() => BrandImageScreenViewModel());
  serviceLocator.registerFactory(() => AppSiteThemeViewModel());
  serviceLocator.registerFactory(() => UrlScreenViewModel());
}
