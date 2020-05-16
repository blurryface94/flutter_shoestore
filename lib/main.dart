import 'package:flutter/material.dart';
import 'package:shoestore/Custom_Icon.dart';
import 'data.dart';

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
            "Lorem Ipsem",
            style: TextStyle(fontSize: 18.0, fontFamily: "Montserrat-Medium"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f3f0),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildGradientContainer(width, height),
              _buildAppBar(),
              _buildTitle(height),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    height: height * .6,
                    child: ListView.builder(
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 35.0, bottom: 60.0),
                          child: SizedBox(
                            width: 200.0,
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
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
