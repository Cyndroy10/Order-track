import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:order_track/model/product.dart';

void addData(Product product){
  var now = new DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');
  String formattedDate = formatter.format(now);
  final firestoreInstance = FirebaseFirestore.instance;
  firestoreInstance.collection("userOrders").add(
    {
      "orderId" : "1",
      "itemName" : product.pName,
      "itemPrice" : product.pPrice,
      "date" : formattedDate,
      "timestamp": Timestamp.now()
    }
  );
  // getData();
}


// Stream<QuerySnapshot> getData(){
//   // var now = new DateTime.now();
//   // var formatter = new DateFormat('dd-MM-yyyy');
//   // String formattedDate = formatter.format(now);
//   final firestoreInstance = FirebaseFirestore.instance;
//   firestoreInstance.collection("userOrders").get().then((querySnapshot) =>
//   {
//     if(querySnapshot.exists)
//     return querySnapshot;
//     // querySnapshot.docs.forEach((data) {
//     //   print(data.data());
//     // })
//   });
//
// }