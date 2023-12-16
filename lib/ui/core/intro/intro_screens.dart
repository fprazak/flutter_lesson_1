import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/main.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  IntroScreensState createState() => IntroScreensState();
}

class IntroScreensState extends State<IntroScreens> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    //tmp navigation to some default screen
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MyHomePage(title: "Yes we did it")));
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(
      "assets/images/intro/$assetName",
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const bodyStyle = TextStyle(fontSize: 19.0);

    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: size.height * 0.05),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      pages: [
        PageViewModel(
          title: "Discover the world",
          body:
              "Unleash your wanderlust and embark on an extraordinary adventure that will transform the way you see the world.",
          image: _buildImage('intro_world.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Make friends",
          body:
              "Whether you're a solo traveler seeking connection or a group seeking to expand its social circle, our app will connect you with like-minded individuals from around the globe.",
          image: _buildImage('intro_friends.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Find the one",
          body:
              "Let the magic unfold as you discover the world's hidden gems, find love's true meaning, and create a journey that will forever hold a special place in your heart.",
          image: _buildImage('intro_love.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.black87,
      ),
      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.redAccent,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
