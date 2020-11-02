import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:random_app/constants/constants.dart';

void main() {
  runApp(MaterialApp(
    title: "Random app",
    home: FirstPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add,color: Colors.white,),
      ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                "assets/menu.png",
                height: 30,
                width: 20,
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "See What Others\n Are Making",
                style:
                    TextStyle(fontSize: 24, fontFamily: Constants.FontSemiBolo),
              ),
              _getSizeBox(20, 0),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                    borderRadius: BorderRadius.circular(50)),
                child: TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffd7d8dd),
                            borderRadius: BorderRadius.circular(10),

                          ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Image.asset(Constants.AsetsImage+"eating.png"),
                        ),
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(6),
                    hintText: "Search for a recipe",
                  ),
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if(index==0){
                      return _getChatListAdd();
                    }
                    else{
                      return _getChatList();
                    }
                  },
                ),
              ),
              Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xfff0f0f0)
                ),
              ),
              _getSizeBox(20, 0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Popular Recipes",style: TextStyle(fontFamily: Constants.FontSemiBolo,fontSize: 20),),
              ),
              _getSizeBox(10, 0),
              Container(
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return _getItem();
                    },
                  ),
                ),
              )            ],
          ),
        ));
  }

  Widget _getSizeBox(double h, double w) {
    return SizedBox(height: h, width: w);
  }

  Widget _getChatList(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(Constants.AsetsImage+"profile.png",),

          ),
          _getSizeBox(5, 0),
          Text("Ralph")
        ],
      ),
    );
  }

  Widget _getChatListAdd(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xfff0f0f0),
            child: Image.asset(Constants.AsetsImage+"plus.png",height: 20,width: 20,),
          ),
        ],
      ),
    );
  }

  Widget _getItem(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: AssetImage(Constants.AsetsImage+"food.png",),
                  fit: BoxFit.cover
                )

            ),
            child: Stack(
              children: [
                Positioned(
                  left: 15,
                  bottom: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffcab9a8),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.alarm,color: Colors.white,),
                        Text("1 Hour ",style: TextStyle(color: Colors.white,fontFamily: Constants.FontRegular),)
                      ],
                    ),
                  ),
                )
              ],
            ),

          ),
          Container(
            height: 100,
            child: Text("hello"),
          )
        ],
      ),
    );
  }

}
