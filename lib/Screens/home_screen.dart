import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/detail_screen.dart';
import 'package:flutterapp/coffee_card.dart';
import 'package:flutterapp/coffee_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

enum Type { cappucino, americano, latte, espresso, ristretto }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController =
      PageController(viewportFraction: 0.75, initialPage: 0);

  Type
      selectedType; // for the ternary operation in the setting the lighting in the bottom row

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 231, 231, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 30),
                child: Text(
                  "Select",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "Coffee",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: _buildSmoothPageIndicator(),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: _buildPageView(),
              ),
              SizedBox(
                height: 9,
              ),
              _buildBottomNavRow(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildBottomNavRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                print('Arrow was clicked');
              },
              iconSize: 20.0,
            ),
          ),
          FlatButton(
            child: Text(
              "Cappucino",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15.0,
                color: selectedType == Type.cappucino
                    ? Colors.black54
                    : Colors.grey,
                fontWeight: FontWeight.w800,
              ),
            ),
            onPressed: () {
              setState(() {
                selectedType = Type.cappucino;

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      backgroundColor: Color.fromRGBO(237, 231, 231, 1),
                      body: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50.0, top: 30),
                                child: Text(
                                  "Select",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  "Coffee",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.2),
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: _buildSmoothPageIndicator(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Center(
                                  child: Container(
                                    // margin: EdgeInsets.only(right:10),
                                    height: 350,
                                    // width: MediaQuery.of(context).size.width/0.1,

                                    child: PageView.builder(
                                        controller:
                                            PageController(initialPage: 0),
                                        itemCount: CappucinoCoffeeList
                                            .cappucinocoffeelist.length,
                                        itemBuilder: (context, index) {
                                          Coffee coffee = CappucinoCoffeeList
                                              .cappucinocoffeelist[index];
                                          var name = coffee.coffeeName;
                                          var image = coffee.coffeeImage;
                                          var price = coffee.coffeePrice;
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                  return DetailScreen(
                                                    coffeeName: name,
                                                    coffeeImage: image,
                                                    coffeePrice: price,
                                                  );
                                                }),
                                              );
                                            },
                                            child: CoffeeCard(
                                                coffeeName: name,
                                                coffeeImage: image,
                                                coffeePrice: price,
                                                coffeeSubtext:
                                                    coffee.coffeesubText),
                                          );
                                        }),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_back),
                                      color: Colors.black,
                                      onPressed: () {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return HomeScreen();
                                            }),
                                          );
                                        });
                                      },
                                      iconSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              });
            },
          ),
          FlatButton(
            child: Text(
              'Americano',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15.0,
                fontWeight: FontWeight.w800,
                color: selectedType == Type.americano
                    ? Colors.black54
                    : Colors.grey,
              ),
            ),
            onPressed: () {
              setState(() {
                selectedType = Type.americano;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      backgroundColor: Color.fromRGBO(237, 231, 231, 1),
                      body: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50.0, top: 30),
                                child: Text(
                                  "Select",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  "Coffee",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.2),
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: _buildSmoothPageIndicator(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Center(
                                  child: Container(
                                    // margin: EdgeInsets.only(right:10),
                                    height: 350,
                                    // width: MediaQuery.of(context).size.width/0.1,

                                    child: PageView.builder(
                                        controller:
                                            PageController(initialPage: 0),
                                        itemCount: AmericanoCoffeeList
                                            .americanocoffeelist.length,
                                        itemBuilder: (context, index) {
                                          Coffee coffee = AmericanoCoffeeList
                                              .americanocoffeelist[index];
                                          var name = coffee.coffeeName;
                                          var image = coffee.coffeeImage;
                                          var price = coffee.coffeePrice;
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                  return DetailScreen(
                                                    coffeeName: name,
                                                    coffeeImage: image,
                                                    coffeePrice: price,
                                                  );
                                                }),
                                              );
                                            },
                                            child: CoffeeCard(
                                                coffeeName: name,
                                                coffeeImage: image,
                                                coffeePrice: price,
                                                coffeeSubtext:
                                                    coffee.coffeesubText),
                                          );
                                        }),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_back),
                                      color: Colors.black,
                                      onPressed: () {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return HomeScreen();
                                            }),
                                          );
                                        });
                                      },
                                      iconSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              });
            },
          )
        ],
      ),
    );
  }

  SmoothPageIndicator _buildSmoothPageIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: CoffeeList.coffeeList.length,
      effect: ExpandingDotsEffect(
        dotHeight: 7.0,
        dotWidth: 8.5,
        activeDotColor: Colors.black87,
        radius: 6.0,
        spacing: 3.0,
      ),
    );
  }

  Container _buildPageView() {
    return Container(
      // margin: EdgeInsets.only(right:10),
      height: 350,
      // width: MediaQuery.of(context).size.width/0.1,

      child: PageView.builder(
          controller: _pageController,
          itemCount: CoffeeList.coffeeList.length,
          itemBuilder: (context, index) {
            Coffee coffee = CoffeeList.coffeeList[index];
            var name = coffee.coffeeName;
            var image = coffee.coffeeImage;
            var price = coffee.coffeePrice;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailScreen(
                      coffeeName: name,
                      coffeeImage: image,
                      coffeePrice: price,
                    );
                  }),
                );
              },
              child: CoffeeCard(
                  coffeeName: name,
                  coffeeImage: image,
                  coffeePrice: price,
                  coffeeSubtext: coffee.coffeesubText),
            );
          }),
    );
  }
}


