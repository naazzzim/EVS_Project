import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerApp/Screens/Classes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDatabase{
  var users = FirebaseFirestore.instance.collection('Users');

  Future<void> createUser(String name,String userType) async {

    if(userType == 'Customer') {
      await users.doc(FirebaseAuth.instance.currentUser.email).set({
        'Name': name,
        'UserType': userType
      });
    }
    else{
      await users.doc(FirebaseAuth.instance.currentUser.email).set({
        'Name': name,
        'UserType': userType,
        'Markets': [],
      });
    }
  }

  Future<UserClass> getUsers() async {
    String name;
    String userType;
    List<dynamic> markets;
    await users.doc(FirebaseAuth.instance.currentUser.email).get().then((DocumentSnapshot doc){
      name = doc['Name'];
      userType = doc['UserType'];
      if(doc['UserType'] == 'Producer')
        markets = doc['Markets'];
    });
    return UserClass(name: name,userType: userType,markets: markets);
  }

  Future<void> addMarketToUser(String name, String uid) async {
    Map<dynamic,dynamic> data = {'Name': name,'uid': uid};
    List<dynamic> dbData;
    await users.doc(FirebaseAuth.instance.currentUser.email).get().then((DocumentSnapshot doc){
      dbData = doc['Markets'];
    });
    dbData.add(data);
    await users.doc(FirebaseAuth.instance.currentUser.email).update({
      'Markets': dbData
    });
  }

  Future<void> addOrderToUser(String market_uid,String market_order_id, OrderClass order) async {
    dynamic id = users.doc(FirebaseAuth.instance.currentUser.email).collection('UserOrders').doc().id;
    await users.doc(FirebaseAuth.instance.currentUser.email).collection('UserOrders').doc(id).set({
      'MarketName': order.marketName,
      'Order': order.order,
      'TimeStamp': order.timeStamp,
      'isCompleted': order.isCompleted,
      'Market_uid': market_uid,
      'Market_order_id': market_order_id,
      'Customer_order_id': id,
      'Location': {'geohash':order.geohash,'geopoint':order.geopoint},
    });
  }

  Future<void> updateOrderStatus(OrderClass order) async {
    await users.doc(FirebaseAuth.instance.currentUser.email).collection('UserOrders').doc(order.customer_order_id).update({
      'isCompleted': true,
    });
  }

}