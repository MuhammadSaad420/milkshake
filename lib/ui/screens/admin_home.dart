import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                ImageAssets.sample_background,
              ),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
