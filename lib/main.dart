import 'package:flutter/material.dart';
import 'package:shoestore/Custom_Icon.dart';
import 'data.dart';
import 'package:shoestore/ProductDetailScreen.dart';
import 'package:shoestore/ProductDetails.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  Widget _buildGradientContainer(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .8,
        height: height / 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFfbfcfd), Color(0xFFf2f3f8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1.0])),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 40.0,
      left: 20.0,
      right: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(CustomIcons.menu, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CustomIcons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildTitle(double height) {
    return Positioned(
      top: height * .2,
      left: 30.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Converse Classics",
            style: TextStyle(fontSize: 28.0, fontFamily: "Montserrat-Bold"),
          ),
          Text(
            "Chuck Taylor All Star Classics",
            style: TextStyle(fontSize: 16.0, fontFamily: "Montserrat-Medium"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("check"),
//      ),
      backgroundColor: Color(0xFFf2f3f0),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;

//          return ListView.builder(
//            itemCount: products.length,
//            itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
//              Navigator.push(
//                  context,

//                  PageRouteBuilder(
//                      transitionDuration: Duration(milliseconds: 350),
//                      pageBuilder: (context, _, __) =>
//                          ProductDetail(product: products[0])));
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => ProductDetail()),
//                  );
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ProductDetail(
                          product: products[0],
                        )),
              );
            },
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _buildGradientContainer(width, height),
                _buildAppBar(),
                _buildTitle(height),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      height: height * .65,
                      child: ListView.builder(
                        itemCount: images.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 35.0, bottom: 60.0),
                            child: SizedBox(
                              width: 180.0,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 45.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: (index % 2 == 0)
                                              ? Colors.white
                                              : Color(0xFF2a2d3f),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0.0, 10.0),
                                                blurRadius: 10.0)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        products[index].imagePath,
                                        height: 199.0,
                                        width: 172.5,
                                      ),
//
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(title[index],
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontFamily:
                                                        "Montserrat-Bold",
                                                    color: (index % 2 == 0)
                                                        ? Color(0xFF2a2d3f)
                                                        : Colors.white)),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Text("New Sell",
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontFamily:
                                                        "Montserrat-Medium",
                                                    color: (index % 2 == 0)
                                                        ? Color(0xFF2a2d3f)
                                                        : Colors.white)),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text("\$" + price[index],
                                                style: TextStyle(
                                                    fontSize: 30.0,
                                                    fontFamily:
                                                        "Montserrat-Bold",
                                                    color: (index % 2 == 0)
                                                        ? Color(0xFF2a2d3f)
                                                        : Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.panorama_horizontal),
              title: Container(
                height: 0.0,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              title: Container(
                height: 0.0,
              ))
        ],
      ),
      floatingActionButton: Container(
        width: 65.0,
        height: 65.0,
        decoration: BoxDecoration(
            color: Color(0xFFfa7b58),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFf78a6c).withOpacity(.6),
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0)
            ]),
        child: RawMaterialButton(
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 35.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
