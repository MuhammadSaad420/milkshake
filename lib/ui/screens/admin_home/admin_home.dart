import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/font_manager.dart';
import 'package:milkshake_practise/ui/resources/string_manager.dart';
import 'package:milkshake_practise/ui/resources/values_manager.dart';
import 'package:milkshake_practise/ui/widgets/text_widget.dart';

import 'components/add_first_widget.dart';
import 'components/home_appbar_widget.dart';
import 'components/made_with_widget.dart';

class AdminHomeScreen extends StatelessWidget {
  static const List<Widget> _tabs = [HomeTab(), SettingsTab()];
 static const List<BottomNavigationBarItem> _listOfBarItem = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_filled), label: AppStrings.home),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(ImageAssets.ic_catalog)),
        label: AppStrings.catalog),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(ImageAssets.ic_plus)),
    ),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(ImageAssets.ic_visitor)),
        label: AppStrings.visitors),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded), label: AppStrings.account)
  ];
  const AdminHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: AppColors.primary, items: _listOfBarItem),
      tabBuilder: (context, index) {
        return _tabs[index];
      },
    ));
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBarWidget(),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageAssets.sample_background,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _getContentWidget(),
            ),
          ),
        )
      ],
    );
  }

  Column _getContentWidget() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextWidget(
            title: AppStrings.getStarted,
            textColor: AppColors.white,
            alignemt: TextAlign.left,
            fontSize: FontSize.s13,
          ),
        ),
        AddFirstWidget(),
        MadeWithWidget()
      ],
    );
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
