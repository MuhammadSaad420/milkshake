import 'package:flutter/material.dart';
import 'package:milkshake_practise/business_logic/view_model/url_screen_viewmodel.dart';
import 'package:milkshake_practise/services/service_locator.dart';
import 'package:provider/provider.dart';

import '../resources/asset_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_fields.dart';
import '../widgets/text_widget.dart';

class UrlScreen extends StatelessWidget {
  final viewModel = serviceLocator<UrlScreenViewModel>();
  final TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  UrlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => viewModel),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppPadding.p20,
              AppPadding.p74,
              AppPadding.p20,
              AppPadding.p64,
            ),
            child: Form(
              key: _formKey,
              child: Consumer<UrlScreenViewModel>(
                builder: ((context, model, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const TextWidget(
                            title: AppStrings.urlFieldTitle,
                            textColor: AppColors.black,
                            fontSize: FontSize.s24,
                            fontWeight: FontWeightManager.bold,
                          ),
                          const SizedBox(
                            height: AppSize.s8,
                          ),
                          const TextWidget(
                            title: AppStrings.urlFieldSubTitle,
                            textColor: AppColors.grey1,
                            fontWeight: FontWeightManager.normal,
                            alignemt: TextAlign.center,
                          ),
                          const SizedBox(
                            height: AppSize.s46,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: TextWidget(
                              title: AppStrings.preUrl,
                              textColor: AppColors.grey1,
                              fontWeight: FontWeightManager.semiBold,
                              fontSize: FontSize.s11,
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s6,
                          ),
                          UrlFormFieldWithIcon(
                            nameFieldController: _textEditingController,
                            iconPressed: () {
                              if (model.isSomethingEntered) {
                                _textEditingController.clear();
                              }
                            },
                            iconImage: _getWidget(model),
                            hintText: AppStrings.urlFieldTitle,
                            inputType: TextInputType.emailAddress,
                            onValidateHandler: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.emptyFieldError;
                              }
                            },
                            onSavedHandler: (value) {},
                            onTextEntered: (value) {
                              if (!value!.isEmpty) {
                                if (value.length >= 9) {
                                  if (value == "takentaken") {
                                    print("inside");
                                    model.setUrlTaken(true);
                                    model.setUrlGreat(false);
                                    model.setSomethingEntered(false);
                                    return;
                                  } else {
                                    model.setUrlGreat(true);
                                  }
                                } else {
                                  model.setSomethingEntered(true);
                                  model.setUrlGreat(false);
                                }
                              } else {
                                model.setSomethingEntered(false);
                                model.setUrlTaken(false);
                                model.setUrlGreat(false);
                              }
                            },
                          ),
                          model.isUrlGreat
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppPadding.p19,
                                      vertical: AppPadding.p5),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextWidget(
                                      title: AppStrings.greatName,
                                      textColor: AppColors.green,
                                      fontSize: FontSize.s11,
                                    ),
                                  ),
                                )
                              : model.isUrlTaken
                                  ? const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppPadding.p19,
                                          vertical: AppPadding.p5),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextWidget(
                                          title: AppStrings.urlTakenError,
                                          textColor: AppColors.error,
                                          fontSize: FontSize.s11,
                                        ),
                                      ),
                                    )
                                  : Container()
                        ],
                      ),
                      ButtonWidget(
                          buttonTitle: AppStrings.continueTitle,
                          onBtnPressed: () {
                            if (model.isUrlGreat) {
                              Navigator.pushNamed(context, Routes.fontsRoute);
                            }
                          })
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getWidget(UrlScreenViewModel model) {
    //model.isSomethingEntered
    // ? model.isUrlGreat
    //     ? ImageAssets.tickIc
    //     : model.isUrlTaken
    //         ? ImageAssets.ic_error
    //         : ImageAssets.ic_pencil
    // : ImageAssets.ic_pencil,
    if (model.isSomethingEntered) {
      return ImageAssets.ic_cross;
    } else if (model.isUrlGreat) {
      return ImageAssets.tickIc;
    } else if (model.isUrlTaken) {
      return ImageAssets.ic_error;
    } else {
      return ImageAssets.ic_pencil;
    }
  }
}
