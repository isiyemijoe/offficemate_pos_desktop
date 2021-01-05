import 'package:flutter/material.dart';
import 'staticItems.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Flexible(
                child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  meeting,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.black12.withOpacity(0.4)),
                )
              ],
            )),
            Container(
              color: white,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              width: MediaQuery.of(context).size.width * 0.40,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/office.png",
                      height: 60,
                      filterQuality: FilterQuality.high,
                      width: 200,
                    ),
                    Text(
                      "Sign into your Officemate account",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: lightgrey, width: 1))),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
