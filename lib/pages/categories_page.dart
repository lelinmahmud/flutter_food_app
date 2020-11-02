import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:random_app/constants/constants.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {



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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text(
              "See What Others\n Are Making",
              style:
              TextStyle(fontSize: 24, fontFamily: Constants.FontSemiBolo),
            ),
          ),
          _getSizeBox(20, 0),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
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
          ),
          _getSizeBox(20, 0),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text("Categories",style: TextStyle(fontFamily: Constants.FontSemiBolo,fontSize: 24),),
          ),
          _getSizeBox(10, 0),
          Container(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    itemCount: 13,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xfff0f0f0),
                                borderRadius: BorderRadius.all(Radius.circular(12))),
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                child: Image.asset(Constants.AsetsImage+"burger.png")
                            ),
                          ),
                          _getSizeBox(10, 0),
                          Text("Freakfast",style: TextStyle(fontSize: 16,fontFamily: Constants.FontSemiBolo),),
                          _getSizeBox(5, 0),
                          Text("300 recipes",style: TextStyle(fontSize: 12,fontFamily: Constants.FontLight),)
                        ],
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return new StaggeredTile.count(1, index.isEven ? 1 : 1.2);
                    }),
              ),
            ),
          )

        ],
      ),
    );
  }


  Widget _getSizeBox(double h, double w) {
    return SizedBox(height: h, width: w);
  }
}
