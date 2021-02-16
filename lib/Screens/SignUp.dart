import 'dart:ui';

import 'package:flutter/material.dart';

import 'Theme.dart';

class SignUp extends StatefulWidget {
  static String id = 'SignUp';
  final greenAccent = const Color(0xff1ef6e3);
  final darkBlue = const Color(0xff1f1a30);
  final darkGray = const Color(0xff1e1e1e);
  final lightGray = const Color(0xff2b2f38);
  final blueGray = const Color(0xff172d44);
  final blue = const Color(0xff0052d2);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          child: Container(
            color: LightTheme.starWhite,
            height: _height,
            width: _width,
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: Column(
                    children: [
                      Spacer(
                        flex: 4,
                      ),
                      Container(
                        height: 100,
                        alignment: Alignment.centerLeft,
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: LightTheme.darkGray,
                                fontWeight: FontWeight.w500,
                                fontSize: 36),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.blueAccent)),
                    height: _height / 1.5,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 60,
                            width: 300,
                            color: LightTheme.darkGray.withOpacity(0.3),
                            padding: EdgeInsets.fromLTRB(10, 2, 5, 5),
                            child: TextFormField(
                              style: TextStyle(
                                  color: LightTheme.darkGray, fontSize: 14),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                icon: Container(
                                  padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                  child: Icon(
                                    Icons.account_box,
                                    color: LightTheme.darkGray,
                                    size: 20,
                                  ),
                                ),
                                hintText: 'User Name',
                                hintStyle: TextStyle(
                                    color: LightTheme.darkGray.withOpacity(0.7),
                                    fontFamily: "Montserrat"),
                                filled: false,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 60,
                            width: 300,
                            color: LightTheme.darkGray.withOpacity(0.3),
                            padding: EdgeInsets.fromLTRB(10, 2, 5, 5),
                            child: TextFormField(
                              style: TextStyle(
                                  color: LightTheme.darkGray, fontSize: 14),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                icon: Container(
                                  padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                  child: Icon(
                                    Icons.email,
                                    color: LightTheme.darkGray,
                                    size: 20,
                                  ),
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: LightTheme.darkGray.withOpacity(0.7),
                                    fontFamily: "Montserrat"),
                                filled: false,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 60,
                            width: 300,
                            color: LightTheme.darkGray.withOpacity(0.3),
                            padding: EdgeInsets.fromLTRB(10, 2, 5, 5),
                            child: TextFormField(
                              style: TextStyle(
                                  color: LightTheme.darkGray, fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                icon: Container(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Icon(
                                    Icons.vpn_key,
                                    color: LightTheme.darkGray,
                                    size: 20,
                                  ),
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: LightTheme.darkGray.withOpacity(0.7),
                                    fontFamily: "Montserrat"),
                                filled: false,
                              ),
                              obscureText: true,
                            ),
                          ),
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 60,
                            width: 300,
                            color: LightTheme.darkGray.withOpacity(0.3),
                            padding: EdgeInsets.fromLTRB(10, 2, 5, 5),
                            child: TextFormField(
                              style: TextStyle(
                                  color: LightTheme.darkGray, fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                icon: Container(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Icon(
                                    Icons.vpn_key,
                                    color: LightTheme.darkGray,
                                    size: 20,
                                  ),
                                ),
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                    color: LightTheme.darkGray.withOpacity(0.7),
                                    fontFamily: "Montserrat"),
                                filled: false,
                              ),
                              obscureText: true,
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: GestureDetector(
                            child: Container(
                              color: Colors.blueAccent,
                              height: 50,
                              width: 250,
                              child: Center(
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    color: DarkTheme.darkGray,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Row(
                            children: <Widget>[
                              Spacer(
                                flex: 1,
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                child: Center(
                                  child: Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      color: LightTheme.darkGray.withOpacity(0.7),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color:
                                            LightTheme.darkGray.withOpacity(0.7),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}