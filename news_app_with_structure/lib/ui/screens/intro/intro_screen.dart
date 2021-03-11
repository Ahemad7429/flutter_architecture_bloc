import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:news_app_with_structure/ui/screens/login/login_screen.dart';
import 'package:news_app_with_structure/utils/constants/app_constant.dart';
import 'package:news_app_with_structure/utils/theme/app_theme.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen();
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  _IntroScreenState();
  bool clicked = false;
  void afterIntroComplete() {
    setState(() {
      clicked = true;
    });
  }

  final List<PageViewModel> pages = [
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          const Text(
            'FREE GIFT',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
                color: AppTheme.color.mainColor,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
      body:
          "Free gifts with purchase. Offer free gifts like a gift wrap, gift card, or any free product.",
      image: Center(child: SvgPicture.asset(AppConst.assets.icGift)),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(20)),
    ),
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          const Text(
            'PAYMENT INTEGRATION',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
                color: AppTheme.color.mainColor,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
      body:
          "A payment gateway as a merchant service that processes credit card payments for ecommerce sites and traditional brick and mortar stores.",
      image: Center(
          child: SizedBox(
        width: 450.0,
        child: SvgPicture.asset(AppConst.assets.icPayment),
      )),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(20)),
    ),
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          const Text(
            'CALL CENTER',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
                color: AppTheme.color.mainColor,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
      body:
          "Call center gives a small business a big business feel. 24-hour sales, order entry, payment processing, billing inquiries, and more.",
      image: Center(
          child: SizedBox(
        width: 450.0,
        child: SvgPicture.asset(AppConst.assets.icCall),
      )),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(20)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return clicked
        ? const LoginScreen()
        : IntroductionScreen(
            pages: pages,
            onDone: () {
              afterIntroComplete();
            },
            onSkip: () {
              afterIntroComplete();
            },
            showSkipButton: true,
            skip: const Text('Skip',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
            next: const Icon(Icons.navigate_next),
            done: const Text("DONE",
                style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(7.0),
                activeSize: const Size(20.0, 5.0),
                activeColor: AppTheme.color.mainColor,
                color: Colors.black12,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          );
  }
}
