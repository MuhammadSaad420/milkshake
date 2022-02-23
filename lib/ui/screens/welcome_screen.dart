import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/asset_manager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(ImageAssets.welcomeImage),
            Image.asset(ImageAssets.mycropageImage),
            const SizedBox(
              height: 45,
            ),
            SocialButton(),
            const SizedBox(
              height: 20,
            ),
            SocialButton()
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 2.0),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(ImageAssets.googleIc),
        const SizedBox(
          width: 10,
        ),
        Text("Signup with Google")
      ]),
    );
  }
}
