import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/font_manager.dart';
import 'package:milkshake_practise/ui/widgets/app_bar.dart';
import 'package:milkshake_practise/ui/widgets/text_widget.dart';

import '../../resources/values_manager.dart';
import '../admin_home/components/home_appbar_widget.dart';

class TextureScreen extends StatelessWidget {
  const TextureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              AppBarWidget(
                appBarType: AppBarType.TRIPLE,
                mainTitle: "Texture",
                backTitle: "Back",
                endTitle: "Done",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: TextWidget(
                  title:
                      "Choose a background texture. You can change this any time in Settings",
                  textColor: AppColors.grey1,
                  fontSize: 13,
                  fontWeight: FontWeightManager.normal,
                  alignemt: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Stack(
                children: [
                  Container(
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 197),
                    height: 450,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageAssets.sample_background),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Color.fromARGB(230, 247, 247, 247),
                          height: 60,
                          child: Column(
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 21.0,
                                      ),
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: AppColors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    TextWidget(
                                      title: "West Bridge",
                                      customFont: "New Rocker",
                                      textColor: AppColors.black,
                                      fontSize: 12,
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 21.0),
                                      child: Icon(
                                        Icons.menu,
                                        color: AppColors.black,
                                        size: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextWidget(title: "Blog", textColor: AppColors.black,)
                      ],
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                    height: 450,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageAssets.iphone_image),
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
