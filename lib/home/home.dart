import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:swipedetector/swipedetector.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController add = TextEditingController();
  String text1 ="Swipe right to complete";
  bool _text1 = false;
  bool _swipeRight = true;
  bool _swipeLeft = true;
  bool _testEditing = false;
  DismissDirection direction;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: true);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _testEditing = true;
    });
    return null;
  }
  void right(){
    setState(() {
      _text1 = true;
      _swipeRight = false;
    });

  }
  void left(){
    setState(() {
      _swipeLeft = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
          child: SwipeDetector(
            onSwipeDown: (){
              setState(() {
                _testEditing = true;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _testEditing?Container(
                  child: TextFormField(

                    controller: add,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color:  Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: new OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color:  Colors.black,
                      ),
                      hintText: 'Enter your Email or Phone',
                    ),
                  ),
                ):Container(),
                _swipeRight?Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  color: Colors.red,
                  child: SwipeTo(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        margin: EdgeInsets.symmetric(),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                          child: Text(
                            "Swipe right to complete"
                          ),
                        ),
                      ),
                    ),

                    onRightSwipe: right,
                  ),
                ):Container(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: _swipeLeft?SwipeTo(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        margin: EdgeInsets.symmetric(),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                          child: Text(
                              "Swipe left to deleted"
                          ),
                        ),
                      ),
                    ),
                    onLeftSwipe: left,
                  ):Container(),
                ),

                _text1?Container(
                  child: Text(text1,style: TextStyle(
                      color: Colors.white,
                    decoration: TextDecoration.lineThrough
                  ),),
                ):Container()
              ],
            ),
          ),

        ),
      ),
    );
  }
}
