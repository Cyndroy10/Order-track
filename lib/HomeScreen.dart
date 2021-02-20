import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_track/util/hexcolor.dart';
import 'package:order_track/model/product.dart';



class HomeScreen extends StatelessWidget {

  final List<Product> products = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("fcf8e8"),
        body: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              topBar(),
              tabs(products,context),
              bottomBar(),
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
    child: Center(child: Text("Sip & Snax", style: TextStyle(fontSize: 40.0,
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: 'Times New Roman'),),),
  );
}

Widget tabs(List<Product> products, BuildContext context) {

  List<Product> snacks = [];
  List<Product> drinks = [];

  for (Product product in products)
    if (product.pType == "snack") {
      snacks.add(product);
    }
    else
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
                                onTap: ()=>{print(snacks[index].pName)},
                                child: Container(
                                  child: Card(
                                    elevation: 5.0,
                                    color: HexColor("d4e2d4"),
                                    child: ListTile(
                                      title: Text(snacks[index].pName),
                                      subtitle: Text( "Rs."+
                                          snacks[index].pPrice.toString() + "/-" ),
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
                                onTap: ()=>{print(snacks[index].pName)}, //function which writes the order to the database
                                child: Container(
                                  child: Card(
                                    elevation: 5.0,
                                    color: HexColor("d4e2d4"),
                                    child: ListTile(
                                      title: Text(drinks[index].pName),
                                      subtitle: Text("Rs."+
                                          drinks[index].pPrice.toString() + "/-"),
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

Widget bottomBar() {
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
                    offset: Offset(
                        0.0,
                        0.0
                    )
                )
              ],
              color: HexColor("d4e2d4"),
              borderRadius: BorderRadius.all(Radius.circular(15.0))

          ),
          // child: Padding(
          //   padding: const EdgeInsets.only(right: 50,left: 50,top: 10.0,bottom: 10.0),
          //   child: Container(
          //
          //
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.all( Radius.circular(15.0))
          //
          //     ),
          //   ),
          // ),
        ),
      ),
    ),
  );
}