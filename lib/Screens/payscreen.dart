import 'package:flutter/material.dart';
import 'package:flutterapp/constants.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payscreen';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _currency = '\$';
  List<String> paytypeList = ['Paypal', 'Credit', 'Wallet'];
  bool isSwitched = true;
  int _listIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFe8eaf6),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black54,
                      iconSize: 40.0,
                      onPressed: (){
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 70.0,
                  ),
                  Text(
                    'Payment data',
                    style: kHeaderStyles,
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                  child: Text(
                    'Total price',
                    style: kHeaderStyles,
                  )
              ),
              Padding(padding: EdgeInsets.only(left: 15.0),
                child:  Text(
                  '$_currency'+args.price.toString(),
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Color(0xFF5C6BC0),
                    fontWeight: FontWeight.w500,
                  ),),),
              SizedBox(
                height: 12.0,
              ),
              Padding(padding: const EdgeInsets.only(left: 15.0),
                child:Text(
                  'Payment Method',
                  style: kHeaderStyles,
                ),

              ),

              //Fix the list here----------
              LayoutBuilder(
                builder: (context, constraints){
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: double.infinity,
                      height: 85.0,

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: paytypeList.length,
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){},
                            child: Padding(
                              padding: EdgeInsets.only( bottom: 8.0),
                              child: Container(
                                margin: EdgeInsets.only(top:3.0),
                                padding: EdgeInsets.all(10.0),
                                height: 30.0,
                                width: 133.0,
                                child: RaisedButton(
                                  onPressed: (){
                                    setState(() {
                                      _listIndex = index;
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Text(paytypeList[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                        ),),
                                      SizedBox(width: 5.0,),
                                      Icon(Icons.check_circle_outline,
                                        color: Colors.white,
                                        size: 30.0,),
                                    ],
                                  ),
                                  color: _listIndex == index ? Color(0xFF5C6BC0): Color(0xFFBBDEFB),

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('Card number', style: kHeaderStyles,),
              ),
              SizedBox(height: 5.0,),
              Container(
                child: Padding(padding: EdgeInsets.only(left: 15.0, top: 0, right: 15.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Image.asset('images/mastercard.png',height: 15.0,width: 15.0,),


                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),

                      hintText: '  ****  ****  ****  ****  ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0,),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),),
              ),
              SizedBox(height: 7.0,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0),
                child: Row(

                  children: <Widget>[
                    Expanded(
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Valid Until', style: kHeaderStyles,),
                          SizedBox(height: 5.0,),
                          TextField(


                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(

                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Month/Year',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                borderSide: BorderSide.none,
                              ),

                            ),

                          ),
                          SizedBox(width: 3.0,),

                        ],
                      ),
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Expanded(
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('CCV', style: kHeaderStyles,),
                          SizedBox(height: 5.0,),
                          TextField(

                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(

                              filled: true,
                              fillColor: Colors.white,
                              hintText: '*** ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                borderSide: BorderSide.none,
                              ),

                            ),

                          ),


                        ],
                      ),
                    ),
                  ],),
              ),
              SizedBox(height: 7.0,),

              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('Card holder', style: kHeaderStyles,),
              ),
              SizedBox(height: 5.0,),
              Container(
                child: Padding(padding: EdgeInsets.only(left: 15.0, top: 0, right: 15.0),
                  child: TextField(

                    style: TextStyle(

                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,

                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),

                      hintText: 'Your name and surname',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0,),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),),
              ),
              SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Save card for future payments',
                    style: kHeaderStyles,
                  ),
                  Switch(value: isSwitched, onChanged: (value){
                    setState(() {
                      isSwitched = value;
                    });
                  },
                    activeTrackColor: Color(0xFFB388FF),
                    activeColor: Color(0xFF5C6BC0),),
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 5.0),
                  padding: EdgeInsets.all(10),
                  height: 70.0,
                  width: double.maxFinite,
                  child: RaisedButton(
                    onPressed: (){
                     Navigator.pushNamed(context, '/');
                    },

                    child: Center(
                      child: Text(
                        'Proceed to confirm',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    color: Color(0xFF5C6BC0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class ScreenArguments {
  final int price;
  ScreenArguments({this.price});

}