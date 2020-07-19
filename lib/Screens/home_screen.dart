import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/detail_screen.dart';
import 'package:flutterapp/coffee_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutterapp/category_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  int _categoryIndex = 0;

 static int _pageIndex = 0;

 var currentPageValue;

  double _pageHeight = 350.0;

  final _pageController =
      PageController(viewportFraction: 0.75, initialPage: _pageIndex);

  Future<String> _loadFromAssets() async {
    return await rootBundle.loadString("assets/data.json");
  }

  Future parseJson() async {
    List<Category> _list = [];
    String jsonString = await _loadFromAssets();
    final jsonResponse = jsonDecode(jsonString);
    for (var i = 0; i < jsonResponse["categories"].length; i++) {
      _list.add(Category.fromJson(jsonResponse["categories"][i]));
    }
    setState(() {
      listOfCategories = _list;
    });

    print(jsonResponse);
  }

  List<Category> listOfCategories = [];

  @override
  void initState() {
    super.initState();
    parseJson();
  }



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
                child: _buildPageView(listOfCategories),
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
                setState(() {
                  if (_categoryIndex == 0)
                    _categoryIndex = 1;
                  else if (_categoryIndex == 1)
                    _categoryIndex = 0;
                });
              },
              iconSize: 20.0,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: 200,
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfCategories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _categoryIndex = index;
                          _pageController.jumpToPage(0);
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          listOfCategories[index].name,
                          style: TextStyle(
                            fontWeight: _categoryIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: _categoryIndex == index ? 18 : 15,
                            color: _categoryIndex == index
                                ? Colors.black54
                                : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  SmoothPageIndicator _buildSmoothPageIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: listOfCategories[_categoryIndex].contents.length,
      effect: ExpandingDotsEffect(
        dotHeight: 7.0,
        dotWidth: 8.5,
        activeDotColor: Colors.black87,
        radius: 6.0,
        spacing: 3.0,
      ),
    );
  }

  Container _buildPageView(List<Category> coffeeList) {
    return Container(
      height: _pageHeight,
      child: PageView.builder(
          controller: _pageController,
          itemCount: listOfCategories[_categoryIndex].contents.length,
          onPageChanged: (index){
            setState(() {
              _pageIndex = index;
            });
            _pageController.addListener(() {
              setState(() {
                currentPageValue = _pageController.page;
              });
            });

          },
          itemBuilder: (context, index) {
            var name = listOfCategories[_categoryIndex].contents[index].name;
            var image = listOfCategories[_categoryIndex].contents[index].image;
            var price = listOfCategories[_categoryIndex].contents[index].price;
            var subText = listOfCategories[_categoryIndex].contents[index].subText;
            if(index == currentPageValue){
              return GestureDetector(
                child: CoffeeCard(
                    coffeeName: name,
                    coffeeImage: image,
                    coffeePrice: price,
                    coffeeSubtext: subText,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailScreen(
                        coffeeName: name,
                        coffeeImage: image,
                        coffeePrice: price.toString(),
                      );
                    }),
                  );
                },
              );

            } else {
              return AnimatedPadding(padding: EdgeInsets.symmetric(vertical: 30.0, ), duration: Duration(milliseconds: 200),
              child: CoffeeCard(
                coffeeName: name,
                coffeeImage: image,
                coffeePrice: price,
                coffeeSubtext: subText,
              ),
              );
            }
//            return GestureDetector(
//              child: AnimatedContainer(
//                duration: Duration(milliseconds: 200),
//                margin: EdgeInsets.symmetric(horizontal: _pageIndex == index ? 25 : 0),
//                curve: Curves.bounceInOut,
//                child: CoffeeCard(
//                    coffeeName: name,
//                    coffeeImage: image,
//                    coffeePrice: price,
//                    coffeeSubtext: subText),
//              ),
//
//
//
//            );
          }),
    );
  }
}
