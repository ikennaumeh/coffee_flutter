import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/detail_screen.dart';
import 'package:flutterapp/coffee_card.dart';
import 'package:flutterapp/coffee_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int _categoryIndex = 0;
  List<Coffee> coffeeList1 = List<Coffee>();
  List<Coffee> coffeeList2 = List<Coffee>();
  Category category1;
  Category category2;
  List<Category> categoryList = List<Category>();

  final _pageController =
      PageController(viewportFraction: 0.75, initialPage: 0);



  @override
  void initState() {
    this.coffeeList1.add(
          Coffee(
              coffeeName: "Cappuccino",
              coffeeImage: "images/coffee1.jpg",
              coffeePrice: "150",
              coffeesubText: "Latesso"),
        );
    this.coffeeList1.add(
          Coffee(
              coffeeName: "Cappuccino",
              coffeeImage: "images/coffee2.jpg",
              coffeePrice: "300",
              coffeesubText: "Latesso"),
        );
    this.coffeeList1.add(
          Coffee(
              coffeeName: "Cappuccino",
              coffeeImage: "images/coffee3.jpg",
              coffeePrice: "450",
              coffeesubText: "Latesso"),
        );
    this.coffeeList1.add(
          Coffee(
              coffeeName: "Cappuccino",
              coffeeImage: "images/coffee4.jpg",
              coffeePrice: "400",
              coffeesubText: "Latesso"),
        );
    this.coffeeList1.add(
          Coffee(
              coffeeName: "Cappuccino",
              coffeeImage: "images/coffee5.jpg",
              coffeePrice: "100",
              coffeesubText: "Latesso"),
        );
    this.coffeeList2.add(
          Coffee(
              coffeeName: "Americano",
              coffeeImage: "images/coffee4.jpg",
              coffeePrice: "350",
              coffeesubText: "Latesso"),
        );
    this.coffeeList2.add(
          Coffee(
              coffeeName: "Americano",
              coffeeImage: "images/coffee5.jpg",
              coffeePrice: "550",
              coffeesubText: "Latesso"),
        );
    this.coffeeList2.add(
          Coffee(
              coffeeName: "Americano",
              coffeeImage: "images/coffee1.jpg",
              coffeePrice: "500",
              coffeesubText: "Latesso"),
        );
    this.coffeeList2.add(
          Coffee(
              coffeeName: "Americano",
              coffeeImage: "images/coffee4.jpg",
              coffeePrice: "550",
              coffeesubText: "Latesso"),
        );
    this.coffeeList2.add(
          Coffee(
              coffeeName: "Americano",
              coffeeImage: "images/coffee2.jpg",
              coffeePrice: "350",
              coffeesubText: "Latesso"),
        );

    this.category1 = Category('Cappucino', this.coffeeList1);
    this.category2 = Category('Americano', this.coffeeList2);

    this.categoryList.add(this.category1);
    this.categoryList.add(this.category2);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Coffee> coffeeList = categoryList[_categoryIndex].coffeeList;
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
                child: _buildPageView(coffeeList),
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
                  else if (_categoryIndex == 1) _categoryIndex = 0;
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
                  itemCount: categoryList.length,
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
                          categoryList[index].title,
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

  Container _buildPageView(List<Coffee> coffeeList) {
    return Container(
      // margin: EdgeInsets.only(right:10),
      height: 350,
      // width: MediaQuery.of(context).size.width/0.1,

      child: PageView.builder(
          controller: _pageController,
          itemCount: coffeeList.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            Coffee coffee = coffeeList[index];
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
