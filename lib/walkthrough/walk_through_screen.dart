import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:protest/home/home.dart';
class WalkThroughUI extends StatefulWidget {
  @override
  _WalkThroughUIState createState() => _WalkThroughUIState();
}

class _WalkThroughUIState extends State<WalkThroughUI> with TickerProviderStateMixin {
  TextEditingController cut= TextEditingController();
  Animation<double> animation;
  AnimationController animationController;
  final int _numPages = 6;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation = Tween<double>(
      begin: 20,
      end: 35,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
    );
    animationController.forward();
  }
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 3.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF707070),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.4,
                    0.7,
                    0.9
                  ],
                  colors: [
                    Color(0xFFFCF4A3),
                    Color(0xFFFDEE87),
                    Color(0xFFFEEB75),
                    Color(0xFFFEE227)
                  ])),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(

                              child: RichText(
                                text: TextSpan(
                                  text: 'Clear Shorts items by',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0, height: 1.3,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' priority.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20.0, height: 1.3,
                                      ),

                                    )
                                  ]
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "Important items are highlighted at the top....",
                              style:TextStyle(
                                color: Colors.black,
                                fontSize: 18.0, height: 1.3,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child:AnimatedBuilder(
                                animation: animationController,
                                builder: (BuildContext ctx, Widget child){
                                  return Container(
                                    child: Image(
                                      image:
                                      AssetImage('assets/images/logo.png'),
                                      height: 300.0,
                                      width: 300.0,
                                    ),
                                  );
                                },
                              )
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(

                              child: RichText(

                                text: TextSpan(
                                    text: 'Tap and Hold ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20.0, height: 1.3,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'to pick an item up.',
                                        style: TextStyle(
                                          color: Colors.black,

                                          fontSize: 20.0,
                                        ),

                                      )
                                    ]
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "Drag it up or down to change its priority",
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                color: Colors.black,
                                fontSize: 18.0, height: 1.3,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Image(
                                image:
                                AssetImage('assets/images/logo2.png'),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "There are three navigation levels...",
                              style:TextStyle(
                                color: Colors.black,
                                fontSize: 18.0, height: 1.3,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Image(
                                image:
                                AssetImage('assets/images/logo3.png'),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(

                              child: RichText(
                                text: TextSpan(
                                    text: 'Pinch together vertically to collapse your current level and navigate up.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0, height: 1.3,
                                    ),

                                ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Image(
                                image:
                                AssetImage('assets/images/logo4.png'),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image:
                                AssetImage('assets/images/cloud.png'),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            Container(

                              child: RichText(
                                text: TextSpan(
                                    text: 'Use',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0, height: 1.3,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' iCloud?.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.0, height: 1.3,
                                        ),

                                      )
                                    ]
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "Storing your list in iCloud allows you to keep your data in sync across your phone iPhone, iPad and Mac.",
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                color: Colors.black,
                                fontSize: 18.0, height: 1.3,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child:Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: TextButton(
                                      child: Text(
                                        "Not Now",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black
                                        ),
                                      ),
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    side: BorderSide(color: Colors.black)
                                                )
                                            )
                                        )
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child:Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: TextButton(
                                        child: Text(
                                          "Use Now",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black
                                          ),
                                        ),
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    side: BorderSide(color: Colors.black)
                                                )
                                            )
                                        )
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Sign up to the newsletter, and unlock a theme for list",
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                color: Colors.black,
                                fontSize: 18.0, height: 1.3,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Center(
                              child: Image(
                                image:
                                AssetImage('assets/images/email.png'),
                                height: 200.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(

                              controller: cut,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(

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
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child:Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: TextButton(
                                        onPressed: (){
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                  context) =>
                                                  new HomePage()),
                                                  (Route<dynamic> route) =>
                                              false);
                                        },
                                        child: Text(
                                          "Skip",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black
                                          ),
                                        ),
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    side: BorderSide(color: Colors.black)
                                                )
                                            )
                                        )
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child:Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: TextButton(
                                      onPressed: (){
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                context) =>
                                                new HomePage()),
                                                (Route<dynamic> route) =>
                                            false);
                                      },
                                        child: Text(
                                          "Join",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black
                                          ),
                                        ),
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    side: BorderSide(color: Colors.black)
                                                )
                                            )
                                        )
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                  child: Container(),
                )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      /*bottomSheet: _currentPage == _numPages - 1
          ? Container(
        height: 80.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          onTap: () => print('get started'),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Get Started',
                  style: TextStyle(
                      color: Color(0xFF5B16D0),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10.0),
                Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF5B16D0),
                  size: 30.0,
                )
              ],
            ),
          ),
        ),
      )
          : Text(''),*/
    );

  }
}
