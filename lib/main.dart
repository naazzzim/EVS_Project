import 'dart:collection';

import 'package:farmerApp/AuthenticationSystem/Wrapper.dart';
import 'package:farmerApp/Screens/Customer/CustomerHome.dart';
import 'package:farmerApp/Screens/Customer/CustomerOrderDetails.dart';
import 'package:farmerApp/Screens/Customer/MarketView.dart';
import 'package:farmerApp/Screens/Loading.dart';
import 'package:farmerApp/Screens/Archived/MarketListUser.dart';
import 'package:farmerApp/Screens/Producer/AddNewMarket.dart';
import 'package:farmerApp/Screens/Producer/AddNewProduct.dart';
import 'package:farmerApp/Screens/Producer/OrderDetails.dart';
import 'package:farmerApp/Screens/Location/SetLocation.dart';
import 'package:farmerApp/Screens/Theme.dart';
import 'package:farmerApp/Screens/Location/ViewLocation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Screens/Archived/MapPage.dart';
import 'Screens/Archived/Page1.dart';
import 'Screens/SignIn.dart';
import 'Screens/SignUp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FarmerApp());
}

class FarmerApp extends StatefulWidget {
  @override
  _FarmerAppState createState() => _FarmerAppState();
}

class _FarmerAppState extends State<FarmerApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      //Page when there is no internet

      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xff4DD172),
                title: Text('Something went wrong'),
                brightness: Brightness.dark,
              ),
              body: Center(
                child: Text('Are you connected to the Network?'),
              )));
    }

    if (!_initialized) {
      return Loading();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cursorColor: LightTheme.greenAccent,
        splashColor: LightTheme.greenAccent,
        textSelectionColor: LightTheme.greenAccent,
        accentColor: LightTheme.greenAccent,
        primaryColor: LightTheme.greenAccent,
        fontFamily: "Montserrat",
      ),
      routes: {
        SignUp.id: (context) => SignUp(),
        Wrapper.id: (context) => Wrapper(),
        AddNewProduct.id: (context) => AddNewProduct(),
        AddNewMarket.id: (context) => AddNewMarket(),
        MarketView.id: (context) => MarketView(),
        CustomerHome.id: (context) => CustomerHome(),
        OrderDetails.id: (context) => OrderDetails(),
        FireMap.id: (context) => FireMap(),
        ViewLocation.id: (context) => ViewLocation(),
        SetLocation.id: (context) => SetLocation(),
        CustomerOrderDetails.id: (context) => CustomerOrderDetails(),
      },
      initialRoute: Wrapper.id,
//      home: Wrapper(),
    );
  }
}
