import 'package:flutter/material.dart';
import 'data.dart';
import 'Custom_Icon.dart';

Color _iconColor = Colors.grey;

class ProductDetail extends StatefulWidget {
  final Product product;
  const ProductDetail({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

Product product = Product();

class _ProductDetailState extends State<ProductDetail> {
  int currentSizeIndex = 0;
  int _counter = 0;

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _decrease() {
    setState(() {
      _counter--;
    });
  }

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
                children: [
                  SizedBox(
                    height: 685,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0, left: 16.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: 40,
                              color: Colors.black.withOpacity(0.9),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                              // Navigator.pop(context);
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            widget.product
                                .imagePath, //fix the change in the image when a block on the stack is tapped
                          ),
                        ),
                        Positioned(
                          top: 385.0,
                          left: 15.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    title[0],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Montserrat-Bold",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200.0,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.favorite_border,
                                        size: 30, color: _iconColor),
                                    onPressed: () {
                                      setState(() {
                                        if (_iconColor == Colors.grey) {
                                          _iconColor = Colors.red;
                                        } else {
                                          _iconColor = Colors.grey;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Container(
                                width: 350.0,
                                height: 100.0,
                                child: Text(widget.product.description,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: "Montserrat-Medium",
                                    )),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text("Size",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: "Montserrat-Bold",
                                      )),
                                  SizedBox(
                                    width: 170.0,
                                  ),
                                  Text(
                                    "Quantity",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: "Montserrat-Bold",
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: sizeNumList.map((item) {
                                      var index = sizeNumList.indexOf(item);
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentSizeIndex = index;
                                          });
                                        },
                                        child: sizeItem(item,
                                            index == currentSizeIndex, context),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      width: 120.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFf2f3f0),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.2),
                                                offset: Offset(0.0, 4.0),
                                                blurRadius: 8.0),
                                          ]),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            flex: 3,
                                            child: GestureDetector(
                                              onTap: _decrease,
                                              child: Container(
                                                height: 25.0,
                                                child: Center(
                                                  child: Text(
                                                    "-",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                        fontFamily:
                                                            "Montserrat-Bold"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          divider(),
                                          Flexible(
                                            flex: 3,
                                            child: Container(
                                              height: 25.0,
                                              child: Center(
                                                child: Text(
                                                  _counter.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      fontFamily:
                                                          "Montserrat-Bold"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          divider(),
                                          Flexible(
                                            flex: 3,
                                            child: GestureDetector(
                                              onTap: _increase,
                                              child: Container(
                                                height: 25.0,
                                                child: Center(
                                                  child: Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                        fontFamily:
                                                            "Montserrat-Bold"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text("\$ " + price[0],
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontFamily: "Montserrat-Bold",
                                  )),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0.0,
                          bottom: 0.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0)),
                            child: SizedBox(
                              height: 60,
                              width: 90.0,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    color: Color(0xFFfa7b58),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_shopping_cart,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: Container(
      width: 35.0,
      height: 35.0,
      decoration: BoxDecoration(
          color: isSelected ? Color(0xFFfa7b58) : Color(0xFFf2f3f0),
          boxShadow: [
            BoxShadow(
                color:
                    isSelected ? Colors.black.withOpacity(.5) : Colors.black12,
                offset: Offset(0.0, 4.0),
                blurRadius: 8.0),
          ],
          borderRadius: BorderRadius.circular(16.0)),
      child: Center(
        child: Text(size,
            style:
                TextStyle(color: Colors.black, fontFamily: "Montserrat-Bold")),
      ),
    ),
  );
}

Widget divider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    child: Container(
      width: 0.8,
      color: Colors.black,
    ),
  );
}
