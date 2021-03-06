import 'package:farmerApp/Database/MarketDatabase.dart';
import 'package:farmerApp/Screens/Classes.dart';
import 'package:farmerApp/Screens/Loading.dart';
import 'package:farmerApp/Screens/Archived/MapPage.dart';
import 'package:farmerApp/Screens/Location/SetLocation.dart';
import 'package:farmerApp/Screens/Location/ViewLocation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Theme.dart';

class AddNewMarket extends StatefulWidget {
  static String id = 'AddNewMarket';
  @override
  _AddNewMarketState createState() => _AddNewMarketState();
}

class _AddNewMarketState extends State<AddNewMarket> {
  final _formKey = GlobalKey<FormState>();

  String ownerName = "";
  String marketName;
  GeoLocation location;
  bool loading = false;
  String error = "";

//  TextEditingController marketNameController = TextEditingController();
//  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ownerName = ModalRoute.of(context).settings.arguments;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return loading? Loading():Scaffold(
      appBar: AppBar(
        title: Text('Add new Market'),
      ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Container(
              height: _height/1.5,
              width: _width,
              child:
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: _height / 1.5,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    'Market Name',
                                    style: TextStyle(
                                        color: LightTheme.darkGray
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14),
                                  ),
                                  alignment: Alignment(-0.95,0),
                                ),
                                TextFormField(
                                  style: TextStyle(
                                      color: LightTheme.darkGray, fontSize: 14),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    filled: false,
                                  ),
                                    validator: (val) => val.isEmpty? 'Field must be filled':null,
                                    onChanged: (value){
                                      setState(() {
                                        marketName = value;
                                      });
                                    }
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    'Location',
                                    style: TextStyle(
                                        color: LightTheme.darkGray
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14),
                                  ),
                                  alignment: Alignment(-0.95,0),
                                ),
                               SizedBox(height: 15,),
                               Center(
                                 child: Text(
                                   location == null? '' : "Location has been selected",
                                   style: TextStyle(
                                       color: LightTheme.darkGray,
                                       fontWeight: FontWeight.w300,
                                       fontSize: 14),
                                 ),
                               ),
                                SizedBox(height: 20,),
                                FlatButton(onPressed: () async{
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => SetLocation(geoLocation: location))).then((value){
                                    setState(() {
                                      location = value;
                                    });
                                  });

                                },
                                    color: LightTheme.greenAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.location_on),
                                          SizedBox(width: 10.0,),
                                          Text('Choose Market Location',
                                          style: TextStyle(
                                              color: LightTheme.darkGray,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14) ,),
                                        ],
                                      ),
                                    )
                                )
//                                 TextFormField(
// //                                  controller: locationController,
//                                   style: TextStyle(
//                                       color: LightTheme.darkGray, fontSize: 14),
//                                   decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10.0, horizontal: 10.0),
//                                     filled: false,
//                                   ),
//                                     validator: (val) => val.isEmpty? 'Field must be filled':null,
//                                     onChanged: (value){
//                                       setState(() {
//                                         location = value;
//                                       });
//                                     }
//                                 ),
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                              ],
                            ),
                          ),
                      ),
                    ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            loading = true;
          });
          if(_formKey.currentState.validate() && location != null){
            Navigator.pop(context);
            await MarketDatabase().addMarket(marketName,ownerName,{'geohash':location.geohash,'geopoint':location.geopoint});
          }
          else{
            setState(() {
              loading = false;
              error =
              'Please enter a valid Email Id and corresponding Password';
            });
          }
        },
        child: Icon(
          Icons.done,
        ),
      ),
    );
  }
}
