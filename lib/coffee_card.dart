import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final coffeeName;
  final coffeeImage;
  final coffeePrice;
  final coffeeSubtext;

  const CoffeeCard(
      {Key key,
      this.coffeeName,
      this.coffeeImage,
      this.coffeePrice,
      this.coffeeSubtext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var containerWidth = constraints.maxWidth;
        var containerHeight = constraints.maxHeight;
        print(containerWidth);
        print(containerHeight);
        return Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(right:15.0),
              width: 260,
              height: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
              ),
              child: Image.asset(
                coffeeImage,
                width: 260,
                // height: 150,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 45,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    coffeeName,
                    style: TextStyle(
                        color: Color.fromRGBO(242, 174, 163, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    coffeeSubtext,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        wordSpacing: 1.4),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: containerHeight / 90,
              right: containerWidth / 105,
              //  left: containerWidth/90,
              //  right: containerWidth,

              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "₦",
                        style: TextStyle(
                          color: Color.fromRGBO(146, 144, 148, 1),
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        width: 1.5,
                      ),
                      Text(
                        coffeePrice,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                width: 65,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(37, 34, 40, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
