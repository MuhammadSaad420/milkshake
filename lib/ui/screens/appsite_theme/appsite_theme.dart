import 'package:flutter/material.dart';
import 'package:milkshake_practise/business_logic/view_model/appsite_theme_viewmodel.dart';
import 'package:milkshake_practise/services/service_locator.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';
import 'package:milkshake_practise/ui/resources/routes_manager.dart';
import 'package:milkshake_practise/ui/screens/appsite_theme/components/custom_checkbox.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import 'components/check_tile_widget.dart';

class BrandThemeScreen extends StatelessWidget {
  AppSiteThemeViewModel viewModel = serviceLocator<AppSiteThemeViewModel>();
  BrandThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Consumer<AppSiteThemeViewModel>(
          builder: ((context, value, child) {
            return Scaffold(
              backgroundColor: value.darkTileChecked
                  ? AppColors.black
                  : AppColors.bgLightScaffold,
              body: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppPadding.p20,
                  AppPadding.p74,
                  AppPadding.p20,
                  AppPadding.p64,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        TextWidget(
                          title: AppStrings.appSiteThemeHeading,
                          textColor: value.lightTileChecked
                              ? AppColors.black
                              : AppColors.white,
                          fontSize: FontSize.s24,
                          fontWeight: FontWeightManager.bold,
                        ),
                        SizedBox(
                          height: AppSize.s8,
                        ),
                        TextWidget(
                          title: AppStrings.appSiteThemeSubHeading,
                          textColor: value.lightTileChecked
                              ? AppColors.grey1
                              : AppColors.white,
                          fontWeight: FontWeightManager.normal,
                          alignemt: TextAlign.center,
                        ),
                        SizedBox(
                          height: AppSize.s74,
                        ),
                        InkWell(
                          onTap: () {
                            value.onLightTileClicked();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomCheckBox(
                                isChecked: value.lightTileChecked,
                                blackMode: value.darkTileChecked,
                              ),
                              SizedBox(
                                width: AppSize.s14,
                              ),
                              CheckTileWidget(
                                cardColor: AppColors.white,
                                textColor: AppColors.black,
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            value.onDarkTileClicked();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomCheckBox(isChecked: value.darkTileChecked),
                              SizedBox(
                                width: AppSize.s14,
                              ),
                              CheckTileWidget(
                                cardColor: AppColors.grey3.withOpacity(0.9),
                                textColor: AppColors.white,
                                buttonColor: AppColors.grey4,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    ButtonWidget(
                      buttonTitle: AppStrings.continueTitle,
                      onBtnPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.urlRoute,
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
