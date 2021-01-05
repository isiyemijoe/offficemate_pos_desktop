import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:officemate_pos_cavidel/signin.dart';
import 'dart:async';
import 'staticItems.dart';
import 'AppEngine.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controller;

  bool navPadding = false;
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool showSignIn = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController();
    scrolPosition();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.bounceIn,
      );
    });
  }

  scrolPosition() {
    controller.addListener(() {
      // print(" the offset is ${controller.offset}");
      if (controller.offset == 0.0) {
        navPadding = true;
      } else {
        navPadding = false;
      }
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 50),
              color: white,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller: controller,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height - 150,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 100),
                          decoration: BoxDecoration(
                              gradient: new LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff00d1ff), Color(0xff007dff)],
                          )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  runSpacing: 5.0,
                                  spacing: 10.0,
                                  children: <Widget>[
                                    SizedBox(width: 20.0, height: 100.0),
                                    Text(
                                      "Welcome to the world of",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 60.0, color: Colors.white),
                                    ),
                                    SizedBox(width: 20.0, height: 100.0),
                                    TypewriterAnimatedTextKit(
                                        pause: Duration(milliseconds: 1000),
                                        speed: Duration(milliseconds: 200),
                                        isRepeatingAnimation: true,
                                        onTap: () {
                                          print("Tap Event");
                                        },
                                        text: [
                                          "Smart",
                                          "Intelligent",
                                          "Reliable",
                                          "Fast"
                                        ],
                                        textStyle: TextStyle(
                                            fontSize: 60.0,
                                            fontFamily: "Horizon"),
                                        textAlign: TextAlign.center),
                                    Text(
                                      "accounting",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 60.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Showcase your ingenuity and keep your books in order with officemate. Enjoy real double entry accounting, track expenses and receivables and have a complete picture of the financial status of your business.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: HoverButton(
                                  onpressed: () {},
                                  height: 50,
                                  minWidth: 200,
                                  color: Color(0xff007dff),
                                  hoverColor: Color(0xff00d1ff),
                                  hoverElevation: 5,
                                  animationDuration:
                                      Duration(milliseconds: 200),
                                  shape: Border.all(color: Colors.transparent),
                                  hoverShape:
                                      Border.all(color: Colors.white, width: 2),
                                  child: Center(
                                    child: Text(
                                      "Start free trial",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.80,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: white),
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: carousal.length,
                            physics: BouncingScrollPhysics(),
                            controller: _pageController,
                            reverse: true,
                            onPageChanged: (value) {
                              print(value);
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                                  child: Row(children: [
                                    Flexible(
                                      child: Center(
                                          child: Image.asset(
                                        carousal[index][1],
                                      )),
                                    ),
                                    Flexible(
                                        child: Container(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    carousal[index][0],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: thirdVariant,
                                                        fontSize: 40,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(height: 20),
                                                  hoverBtn("Try for free",
                                                      btnColor: secondaryColor,
                                                      width: 150,
                                                      textColor: white,
                                                      hoverColor: white,
                                                      hoverTextColor:
                                                          Color(0xff007bff),
                                                      borderColor:
                                                          Colors.transparent,
                                                      hoverBorderColor:
                                                          secondaryColor),
                                                ])))
                                  ]));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            padding: EdgeInsets.symmetric(
                horizontal: 100.0, vertical: navPadding ? 10 : 0),
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  spreadRadius: 10,
                  blurRadius: 10,
                  color: Colors.black12.withOpacity(0.2),
                  offset: Offset(0, 3))
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/office.png",
                  height: 60,
                  filterQuality: FilterQuality.high,
                  width: 200,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HoverWidget(
                      onHover: (_) {
                        showSignIn = true;
                      },
                      child: Text(
                        "How To",
                        style: TextStyle(
                            color: thirdVariant,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      hoverChild: Text(
                        "How To",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    HoverWidget(
                      onHover: (_) {},
                      child: Text(
                        "Features",
                        style: TextStyle(
                            color: thirdVariant,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      hoverChild: Text(
                        "Features",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    HoverWidget(
                      onHover: (_) {},
                      child: Text(
                        "Pricing",
                        style: TextStyle(
                            color: thirdVariant,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      hoverChild: Text(
                        "Pricing",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    HoverWidget(
                      onHover: (_) {},
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                            color: thirdVariant,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      hoverChild: Text(
                        "Contact Us",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    HoverWidget(
                      onHover: (_) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) => Signin()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(
                                color: thirdVariant,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: thirdVariant,
                            size: 18,
                          )
                        ],
                      ),
                      hoverChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    hoverBtn("Get Started",
                        btnColor: secondaryColor,
                        textColor: white,
                        hoverColor: white,
                        hoverTextColor: Color(0xff007bff),
                        borderColor: Colors.transparent,
                        hoverBorderColor: secondaryColor)
                  ],
                )
              ],
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
