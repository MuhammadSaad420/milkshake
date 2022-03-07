import 'package:flutter/material.dart';

import '../../../resources/asset_manager.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final bool blackMode;
  const CustomCheckBox({
    Key? key,
    required this.isChecked,
    this.blackMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(isChecked
        ? ImageAssets.ic_checkbox
        : !blackMode
            ? ImageAssets.ic_uncheckbox
            : ImageAssets.ic_uncheckbox_white);
  }
}
