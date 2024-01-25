import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../root/widget/bottom_nav.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);
  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    InitSlidingAnimation();
    NavigateToHome();
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
              position: slidingAnimation,
              child:   const Text('Watch it',
                style: TextStyle(
                  fontSize: 30,
                ),)
          )
        ],
      ),
    );
  }
  void NavigateToHome() {
    Future.delayed(const Duration(seconds: 2) , (){
     //GoRouter.of(context).push(AppRouter.homeViewPath);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NavBar()),
      );
    });
  }

  void InitSlidingAnimation() {
    animationController = AnimationController(vsync: this ,
        duration: const Duration(seconds: 1) );

    slidingAnimation = Tween<Offset>(begin: const Offset(0,10) ,end: const Offset(0,0)).animate(animationController);

    animationController.forward();
    //to make the ui update
    slidingAnimation.addListener(() {
    });
  }
}