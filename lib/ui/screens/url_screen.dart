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
import '../widgets/description_widget.dart';
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
        resizeToAvoidBottomInset: false,
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
                                  textEnteredEvent(value, model);
                                },
                              ),
                              model.isUrlGreat
                                  ? DescriptionText(
                                      text: AppStrings.greatName,
                                      textColor: AppColors.green,
                                    )
                                  : model.isUrlTaken
                                      ? DescriptionText(
                                          text: AppStrings.urlTakenError,
                                          textColor: AppColors.error,
                                        )
                                      : Container()
                            ],
                          ),
                        ],
                      ),
                      ButtonWidget(
                          isDisabled: !model.isUrlGreat,
                          isBorderStadium: false,
                          buttonTitle: AppStrings.continueTitle,
                          onBtnPressed: () {
                            // if (model.isUrlGreat) {
                            // }
                            
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

  void textEnteredEvent(String? value, UrlScreenViewModel model) {
    if (!value!.isEmpty) {
      if (value.length >= 9) {
        if (value == "takentaken") {
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
  }

  _getWidget(UrlScreenViewModel model) {
    if (model.isUrlGreat) {
      return ImageAssets.tickIc;
    } else if (model.isUrlTaken) {
      return ImageAssets.ic_error;
    } else if (model.isSomethingEntered) {
      return ImageAssets.ic_cross;
    } else {
      return ImageAssets.ic_pencil;
    }
  }
}
