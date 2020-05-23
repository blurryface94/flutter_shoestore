import 'package:flutter/material.dart';
import 'package:shoestore/data.dart';

import 'data.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFfbfcfd), Color(0xFFf2f3f8)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.5, 1.0]))),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 40,
                      color: Colors.black.withOpacity(0.9),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(widget.product.imagePath,
                        height: screenHeight * 0.45),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(widget.product.name,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Montserrat-Bold",
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(widget.product.description,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Montserrat-Medium",
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
