import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  // final String title;
  final String coffeeName;
  final String coffeePrice;
  final String coffeeImage;

  const DetailScreen(
      {Key key, this.coffeeName, this.coffeePrice, this.coffeeImage})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _selectedPosition = -1;

  String _coffeePrice = "0";

  int _cupsCounter = 0;

  int price = 0;

  String _currency = "₦";

  static const String coffeeCup = "images/coffee_cup_size.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: FlatButton(
            onPressed: () {
              _confirmOrderModalBottomSheet(
                  totalPrice: "$_currency$price", numOfCups: "x $_cupsCounter");
            },
            child: Text(
              "Buy Now",
              style: TextStyle(color: Colors.black87),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.blue),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  this.price = 0;
                  this._cupsCounter = 0;
                });
              },
              child: Icon(Icons.clear),
            ),
            Container(
              height: double.maxFinite,
              alignment: Alignment.center,
              child: Text(
                "$_cupsCounter Cups = $_currency$price.00",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child:
                _mainBody()) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _mainBody() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height + 50,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 0,
                child: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 250,
                      margin: EdgeInsets.only(
                          left: 50, right: 50, bottom: 50, top: 60),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(180)),
                          color: Color.fromRGBO(239, 235, 233, 100)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      height: 350,
                      child: Image.asset(
                        widget.coffeeImage,
                        // "images/cup_of_coffee.png",//image
                        height: 300,
                      ),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Expanded(
              flex: 0,
              child: Text(
                widget.coffeeName,
                // "Caffè Americano",//Name
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Expanded(
              flex: 0,
              child: Text(
                "Select the cup size you want and we will deliver it to you in less than 48hours",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              height: 55,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        text: _currency,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black87),
                        children: [
                          TextSpan(
                            text: _coffeePrice,
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        var cupPrice = int.parse(widget.coffeePrice);
                        return InkWell(
                          child: _coffeeSizeButton(_selectedPosition == index,
                              index == 0 ? "S" : index == 1 ? "M" : "L"),
                          onTap: () {
                            setState(() {
                              this._coffeePrice = index == 0
                                  ? "$cupPrice"
                                  : index == 1
                                      ? "${cupPrice * 2}"
                                      : "${cupPrice * 3}";
                              // index == 0 ? "300" : index == 1 ? "600" : "900";
                              _selectedPosition = index;
                            });
                          },
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(10),
              width: double.maxFinite,
              height: 70,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    this._cupsCounter += 1;
                    this.price += int.parse(_coffeePrice);
                  });
                },
                child: Center(
                  child: Text(
                    "Add to Bag",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _coffeeSizeButton(bool isSelected, String coffeeSize) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          width: 55,
          child: Text(
            coffeeSize,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.black45),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(right: 10),
          child: Image.asset(
            coffeeCup,
            width: 50,
            color: isSelected ? Colors.blue : Colors.black45,
          ),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: isSelected ? Colors.blue : Colors.black45,
                      width: isSelected ? 2 : 1),
                  left: BorderSide(
                      color: isSelected ? Colors.blue : Colors.black45,
                      width: isSelected ? 2 : 1),
                  bottom: BorderSide(
                      color: isSelected ? Colors.blue : Colors.black45,
                      width: isSelected ? 2 : 1),
                  right: BorderSide(
                      color: isSelected ? Colors.blue : Colors.black45,
                      width: isSelected ? 2 : 1)),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        )
      ],
    );
  }

  void _confirmOrderModalBottomSheet({String totalPrice, String numOfCups}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 150.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Confirm Order",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(),
                    ),
                    _getEstimate(totalPrice, numOfCups),
                    Expanded(
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Check Out",
                          style: TextStyle(color: Colors.black87),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  Widget _getEstimate(String totalPrice, String numOfCups) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          widget.coffeeImage,
          // "images/cup_of_coffee.png",
          height: 70,
          width: 50,
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
          numOfCups,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
          totalPrice,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
