import 'dart:typed_data';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkshake_practise/business_logic/view_model/brand_image_screen_viewmodel.dart';
import 'package:milkshake_practise/services/service_locator.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';
import 'package:milkshake_practise/ui/resources/routes_manager.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/action_sheet_tile.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';

class BrandImageScreen extends StatefulWidget {
  final Uint8List croppedData;
  const BrandImageScreen({Key? key, required this.croppedData})
      : super(key: key);

  @override
  State<BrandImageScreen> createState() => _BrandImageScreenState();
}

class _BrandImageScreenState extends State<BrandImageScreen> {
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();
  BrandImageScreenViewModel viewModel =
      serviceLocator<BrandImageScreenViewModel>();
  String? splashUrl;

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
          child: Consumer<BrandImageScreenViewModel>(
            builder: ((context, model, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TextWidget(
                        title: AppStrings.brandImageHeading,
                        textColor: AppColors.black,
                        fontSize: FontSize.s24,
                        fontWeight: FontWeightManager.bold,
                      ),
                      SizedBox(
                        height: AppSize.s8,
                      ),
                      TextWidget(
                        title: AppStrings.brandImageSubHeading,
                        textColor: AppColors.grey1,
                        fontWeight: FontWeightManager.normal,
                        alignemt: TextAlign.center,
                      ),
                      SizedBox(
                        height: AppSize.s74,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s25),
                        child: Container(
                            width: AppSize.s126,
                            height: AppSize.s126,
                            color: AppColors.grey2,
                            child: (widget.croppedData.isEmpty)
                                ? (splashUrl == null)
                                    ? (model.imageFile == null)
                                        ? Image.asset(
                                            ImageAssets.placeholderImage,
                                          )
                                        : Image.file(
                                            model.imageFile!,
                                            fit: BoxFit.cover,
                                          )
                                    : ExtendedImage.network(
                                        splashUrl!,
                                        fit: BoxFit.contain,
                                        onDoubleTap: (value) {},
                                        mode: ExtendedImageMode.editor,
                                        extendedImageEditorKey: editorKey,
                                        initEditorConfigHandler: (state) {
                                          return EditorConfig(
                                              maxScale: 8.0,
                                              cropRectPadding:
                                                  const EdgeInsets.all(20.0),
                                              hitTestSize: 20.0,
                                              cropAspectRatio: 3 / 4);
                                        },
                                      )
                                : Image.memory(widget.croppedData)),
                      ),
                      SizedBox(height: AppSize.s22),
                      GestureDetector(
                        onTap: () {
                          _showModelSheet(context, model);
                        },
                        child: TextWidget(
                          title: AppStrings.uploadImage,
                          textColor: AppColors.primary,
                          fontWeight: FontWeightManager.normal,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ButtonWidget(
                          buttonTitle: AppStrings.continueTitle,
                          onBtnPressed: () {
                            Navigator.pushNamed(
                                context, Routes.brandThemeRoute);
                          }),
                      SizedBox(
                        height: AppSize.s14,
                      ),
                      TextWidget(
                        title: AppStrings.setUpLaterText,
                        textColor: AppColors.primary,
                        fontWeight: FontWeightManager.normal,
                        fontSize: FontSize.s14,
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        )),
      ),
    );
  }

  Future<dynamic> _showModelSheet(
      BuildContext context, BrandImageScreenViewModel model) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <Widget>[
          ActionSheetTile(
            iconImage: ImageAssets.cameraIc,
            leadingTitle: AppStrings.useCamera,
            onSheetPressed: () async {
              Navigator.pop(context);
              model.pickImageFromCamera();
            },
          ),
          ActionSheetTile(
            iconImage: ImageAssets.graphicsIc,
            leadingTitle: AppStrings.chooseFromLibrary,
            onSheetPressed: () {
              Navigator.pop(context);
              model.pickImageFromGallery();
            },
          ),
          ActionSheetTile(
            iconImage: ImageAssets.addSplashIc,
            leadingTitle: AppStrings.chooseFromUnsplash,
            onSheetPressed: () async {
              final information = await Navigator.pushNamed(
                  context, Routes.unsplashLibraryRoute);
              Navigator.pop(context);
              setState(() {
                splashUrl = information.toString();
              });
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: TextWidget(
            title: AppStrings.cancel,
            textColor: AppColors.primary,
            fontWeight: FontWeightManager.semiBold,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
