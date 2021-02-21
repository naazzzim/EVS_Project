import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerApp/Screens/Classes.dart';
import 'package:farmerApp/Screens/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyOrder.dart';
import '../Theme.dart';

class MarketView extends StatefulWidget {
  static String id = 'MarketView';
  @override
  _MarketViewState createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  MarketClass market;
  TextEditingController _controller = TextEditingController();
  List<ProductClass> products = [];
  List<dynamic> yourOrder = [];

  @override
  Widget build(BuildContext context) {
    market = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(market.marketName),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Markets').doc(market.uid).collection('Products').snapshots(),
        builder: (context, snapshot) {

          if(!snapshot.hasData)
            return Loading();

          products = [];
          for(DocumentSnapshot doc in snapshot.data.documents){
            products.add(ProductClass(name: doc['Name'],additionalInfo: doc['Additional'],price: doc['Price']));
          }

          return Container(
                height: MediaQuery.of(context).size.height,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        sliver: SliverToBoxAdapter(
                          child: ListTile(
                            title: Text(
                              'Location : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: DarkTheme.darkGray,
                                  fontSize: 18),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left:10.0,top: 10.0),
                              child: Text(
                                'My location is unknown.........testing testing........testing testing testing ',
                                maxLines: 4,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: DarkTheme.darkGray,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        )),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                int amount = 0;
                            return GestureDetector(
                              onTap: ()async {
                                amount = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                        backgroundColor: LightTheme.starWhite,
                                        title: Text(
                                          'How many kg ?',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        content: Container(
                                          height: 150,
                                          child: Column(
                                            children: [
                                              TextField(
                                                controller: _controller,
                                                keyboardType: TextInputType.number,
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.pop(context,int.parse(_controller.text ?? '0'));
                                                  yourOrder.add({
                                                    'ProductName': products[index].name,
                                                    'Quantity': _controller.text,
                                                    'TotalPrice': (double.parse(_controller.text) * double.parse(products[index].price)).toString()
                                                  });
                                                  _controller.clear();
                                                },
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  child: Container(
                                                    width: 100,
                                                    height: 50,
                                                    color: LightTheme.greenAccent,
                                                    child: Center(
                                                      child: Text(
                                                        'Done',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Card(
                                color: LightTheme.greenAccent.withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(products[index].name,
                                    style: TextStyle(
                                      fontSize: 18
                                    ),),
                                  ),
                                  subtitle:Padding(
                                    padding: const EdgeInsets.fromLTRB(8,10,0,10),
                                    child: RichText(
                                      text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text : 'Price : ',
                                              style: TextStyle(
                                                  color: DarkTheme.darkGray
                                              ),
                                            ),
                                            TextSpan(
                                              text : products[index].price.toString(),
                                              style: TextStyle(
                                                  color: DarkTheme.darkGray.withOpacity(0.8)
                                              ),
                                            ),
                                            TextSpan(
                                              text:  '\n\nAdditional Info : ',
                                              style: TextStyle(
                                                  color: DarkTheme.darkGray
                                              ),
                                            ),
                                            TextSpan(
                                              text: products[index].additionalInfo ?? "",
                                              style: TextStyle(
                                                  color: DarkTheme.darkGray.withOpacity(0.8)
                                              ),
                                            ),
                                          ]
                                      ),
                                    ),
                                  ),
                                  trailing: Text('Amount : ' + amount.toString()),
                                ),
                              ),
                            );
                          },
                          childCount: products.length,
                        ),
                      ),
                    )
                  ],
                ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return MyOrder(order: yourOrder,market: market,);
          }));
        },
      ),
    );
  }
}
