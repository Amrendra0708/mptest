import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:protest/walkthrough/walk_through_screen.dart';
import 'package:swipedetector/swipedetector.dart';
class SplashScreenUi extends StatefulWidget {
  @override
  _SplashScreenUiState createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            child: SwipeDetector(
              child: GestureDetector(
                onHorizontalDragUpdate: (dragUpdateDetails) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext
                          context) =>
                          new WalkThroughUI()),
                          (Route<dynamic> route) =>
                      false);
                },
                onTap: (){
                  print("Done");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext
                          context) =>
                          new WalkThroughUI()),
                          (Route<dynamic> route) =>
                      false);
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Welcome to ',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black

                          ),
                          children: [
                            TextSpan(
                              text: 'Clear',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal
                              )
                            )
                          ]
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Tap & Swipe  ',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                              fontWeight: FontWeight.w700,


                            ),
                            children: [
                              TextSpan(
                                  text: 'to begin',
                                  style: TextStyle(
                                      fontSize: 20.0,

                                  )
                              )
                            ]
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onSwipeDown: (){
                setState(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext
                          context) =>
                          new WalkThroughUI()),
                          (Route<dynamic> route) =>
                      false);
                });
              },
              onSwipeLeft:(){
                setState(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext
                          context) =>
                          new WalkThroughUI()),
                          (Route<dynamic> route) =>
                      false);
                });
              },
              onSwipeRight: (){
                setState(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext
                          context) =>
                          new WalkThroughUI()),
                          (Route<dynamic> route) =>
                      false);
                });
              },
              onSwipeUp:  (){
                setState(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext
                          context) =>
                          new WalkThroughUI()),
                          (Route<dynamic> route) =>
                      false);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
