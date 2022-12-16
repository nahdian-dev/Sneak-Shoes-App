import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/presentation/routes/routes_manager.dart';

class SuccesConfirm extends StatelessWidget {
  const SuccesConfirm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder(
              lottie: AssetLottie('assets/animation/succes_animation.json'),
            ),
            SizedBox(height: 20),
            Text('Payment Successful!',
                style: Theme.of(context).textTheme.headline1),
            Text('Your payment has been processed!',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .apply(color: Colors.grey)),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height / 10,
        child: GestureDetector(
          onTap: () => Navigator.pushNamedAndRemoveUntil(
              context, Routes.mainRoute, (route) => false),
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.green,
            ),
            child: Center(
              child: Text(
                "Back to Homepage",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .apply(color: ColorManager.primary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
