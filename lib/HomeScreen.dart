import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_track/model/db.dart';
import 'package:order_track/util/hexcolor.dart';
import 'package:order_track/model/product.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("fcf8e8"),
        body: Container(
          // height: MediaQuery.of(context).size.,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              topBar(),
              tabs(products, context),
              bottomBar(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget topBar() {
  return Container(
    height: 100,
    decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: HexColor("d4e2d4")),
        boxShadow: [
          BoxShadow(
              color: HexColor("d4e2d4"),
              blurRadius: 20.0,
              spreadRadius: 0.5,
              offset: Offset(0.0, 10.0))
        ],
        color: HexColor("ecb390"),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0))),
    child: Center(
      child: Text(
        "Sip & Snax",
        style: TextStyle(
            fontSize: 40.0,
            color: Colors.black26,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'Times New Roman'),
      ),
    ),
  );
}

Widget orderTopBar(BuildContext context) {


  return Container(
    height: 100,
    child: Stack(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: HexColor("d4e2d4")),
              boxShadow: [
                BoxShadow(
                    color: HexColor("d4e2d4"),
                    blurRadius: 20.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.0, 10.0))
              ],
              color: HexColor("ecb390"),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0))),
          child: Center(
            child: Text(
              "Sip & Snax",
              style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.black26,
                size: 40.0,
              ),
              onPressed: () => {Navigator.pop(context)}),
        ),
        // Align(alignment: Alignment.bottomRight,
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(formattedDate,style: TextStyle(
        //           fontSize: 20.0,
        //           color: Colors.black54,
        //           fontWeight: FontWeight.bold,
        //
        //           fontFamily: 'Times New Roman'),),
        //     ))
      ],
    ),
  );
}

Widget tabs(List<Product> products, BuildContext context) {
  List<Product> snacks = [];
  List<Product> drinks = [];

  for (Product product in products)
    if (product.pType == "snack") {
      snacks.add(product);
    } else
      drinks.add(product);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        height: 700,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              shadowColor: HexColor("d4e2d4"),
              // elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              backgroundColor: HexColor("fcf8e8"),
              title: TabBar(
                indicatorColor: HexColor("df7861"),
                labelColor: HexColor("df7861"),
                tabs: [
                  Tab(
                    child: Text(
                      "Snacks",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Drinks",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "other",
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                children: [
                  Center(
                      child: GridView.builder(
                          itemCount: snacks.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 4 / 3),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () => {addData(snacks[index])},
                                child: Container(
                                  child: Card(
                                    elevation: 5.0,
                                    color: HexColor("d4e2d4"),
                                    child: ListTile(
                                      title: Text(snacks[index].pName),
                                      subtitle: Text("Rs." +
                                          snacks[index].pPrice.toString() +
                                          "/-"),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Center(
                      child: GridView.builder(
                          itemCount: drinks.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 4 / 3),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () => addData(drinks[index]),
                                child: Container(
                                  child: Card(
                                    elevation: 5.0,
                                    color: HexColor("d4e2d4"),
                                    child: ListTile(
                                      title: Text(drinks[index].pName),
                                      subtitle: Text("Rs." +
                                          drinks[index].pPrice.toString() +
                                          "/-"),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Center(
                    child: Text(
                      "other",
                      style: TextStyle(color: HexColor("df7861")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget bottomBar(BuildContext context) {
  return Expanded(
    child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: HexColor("d4e2d4")),
              boxShadow: [
                BoxShadow(
                    color: HexColor("d4e2d4"),
                    blurRadius: 40.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0))
              ],
              color: HexColor("d4e2d4"),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.emoji_food_beverage_outlined),
                  tooltip: 'Orders',
                  onPressed: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Orders();
                        }))
                      }),
            ],
          ),
        ),
      ),
    ),
  );
}

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  String formattedDate;
  var sum = 0;
  Map track = new Map();

  getTotal() async {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');

    setState(() {
      formattedDate = formatter.format(now);
    });

    var orders = await FirebaseFirestore.instance
        .collection('userOrders')
        .where("date", isEqualTo: formattedDate)
        .get();

    orders.docs.forEach((element) {
      if (mounted) {
        if (track[element.data()['itemName']] == null) {
          track[element.data()['itemName']] = 1;
        } else {
          track[element.data()['itemName']] =
              track[element.data()['itemName']] + 1;
        }
        setState(() {
          sum = sum + element.data()['itemPrice'];
        });
      }
    });
  }

  @override
  void initState() {
    getTotal();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("fcf8e8"),
        body: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              orderTopBar(context),
              orderList(formattedDate, sum, track),
            ],
          ),
        ),
      ),
    );
  }
}

Widget orderList(String date, var sum, Map itemTrack) {
  Query orders = FirebaseFirestore.instance
      .collection('userOrders')
      .where("date", isEqualTo: date);


  final firestoreInstance = FirebaseFirestore.instance;

  var itemList = itemTrack.keys.toList();
  var itemCount = itemTrack.values.toList();

  return StreamBuilder<QuerySnapshot>(
      stream: orders.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Sorry, something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.data.docs.length == 0) {
          return Text("No Orders For Today");
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Container(child: Text("Date: "+date,style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman'),),),
            ),

            //Orders
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: HexColor("d4e2d4")),
                      boxShadow: [
                        BoxShadow(
                            color: HexColor("d4e2d4"),
                            blurRadius: 40.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0, 0.0))
                      ],
                      color: HexColor("d4e2d4"),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                          child: Text(
                            'Orders :',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Times New Roman'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                        child: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.1, color: HexColor("d4e2d4")),
                                boxShadow: [
                                  BoxShadow(
                                      color: HexColor("d4e2d4"),
                                      blurRadius: 40.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(0.0, 0.0))
                                ],
                                color: HexColor("d4e2d4"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            height: 400,
                            child: Scrollbar(
                              child: ListView.builder(
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 8.0, right: 8.0),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  (index + 1).toString() +
                                                      ". " +
                                                      snapshot.data.docs
                                                          .elementAt(index)
                                                          .data()['itemName']
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontFamily:
                                                          'Times New Roman'),
                                                ),
                                                Spacer(),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    snapshot.data.docs
                                                            .elementAt(index)
                                                            .data()['itemPrice']
                                                            .toString() +
                                                        "₹",
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontFamily:
                                                            'Times New Roman'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),

            //Sale Summary
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: HexColor("d4e2d4")),
                      boxShadow: [
                        BoxShadow(
                            color: HexColor("d4e2d4"),
                            blurRadius: 40.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0, 0.0))
                      ],
                      color: HexColor("d4e2d4"),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                          child: Text(
                            'Sale Summary:',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Times New Roman'),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.1, color: HexColor("d4e2d4")),
                              boxShadow: [
                                BoxShadow(
                                    color: HexColor("d4e2d4"),
                                    blurRadius: 40.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(0.0, 0.0))
                              ],
                              color: HexColor("d4e2d4"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 12.0, bottom: 8.0, right: 8.0),
                            child: Scrollbar(
                              child: ListView.builder(
                                  itemCount: itemList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                itemList[index].toString() +
                                                    " :",
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontFamily:
                                                        'Times New Roman'),
                                              ),
                                              Spacer(),
                                              Text(
                                                itemCount[index].toString() +
                                                    " pcs",
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontFamily:
                                                        'Times New Roman'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        // border: Border.all(width: 0.1, color: HexColor("d4e2d4")),
                        // boxShadow: [
                        //   BoxShadow(
                        //       // color: HexColor("d4e2d4"),
                        //       blurRadius: 10.0,
                        //       spreadRadius: 0.0,
                        //       offset: Offset(0.0, 0.0))
                        // ],
                        // color: HexColor("ecb499"),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Total Sale: " + sum.toString() + "₹",
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Times New Roman'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        // border: Border.all(width: 0.1, color: HexColor("d4e2d4")),

                        color: HexColor("ecb390"),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: ()=>{
                                      firestoreInstance.collection("Sale").add({"date" : date, "totalSale" : sum,}),
                                   },
                        child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Times New Roman'),
                        ),
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
}
