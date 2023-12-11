/*
Name: Kiryl Baravikou
UIN: 656339218
Project 3: Movies App
Course: CS 378
Date: 11/15/2023
Professor: Ugo Buy

Dear TA, just like in the previous project, for this one I had to use
iPhone 14 Pro Max as the emulator due to incompatibility of my machine with
the Pixel 5 emulator. Thank you for understanding!
*/

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'movieCategories/Anime.dart';
import 'movieCategories/Drama.dart';
import 'movieCategories/Comedy.dart';
import 'Sliver.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Add a delay to wait for 2 seconds
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the delay is complete, show the SliverAppBarExample
          return const SliverAppBarExample();
        } else {
          // While waiting for the delay, show the animation
          return const FadeTransitionExample();
        }
      },
    );
  }
}


//Reference: https://api.flutter.dev/flutter/widgets/FadeTransition-class.html
class FadeTransitionExample extends StatefulWidget {
  const FadeTransitionExample({Key? key}) : super(key: key);

  @override
  State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: LoadingAnimationWidget.fourRotatingDots(
          size: 250, color: Colors.black,
        ),
      ),
    );
  }
}

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({Key? key}) : super(key: key);

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1c1c),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 130.0,
            backgroundColor: const Color(0xff393f3b),
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            shadowColor: Colors.black,
            elevation: 10,
            toolbarTextStyle: const TextStyle(color: Colors.black),
            flexibleSpace: Stack(
              fit: StackFit.expand,
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/animation/netflix.jpeg',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  filterQuality: FilterQuality.high,
                ),
                Center(
                  child: Text(
                    "IMDb",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Proxima Nova',
                      backgroundColor: Colors.black.withOpacity(0.3),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Sliver(genre: "ANIMATION"),
          const Anime(),
          const Sliver(genre: "DRAMA"),
          const Drama(),
          const Sliver(genre: "COMEDY"),
          const Comedy(),
        ],
      ),
    );
  }
}







