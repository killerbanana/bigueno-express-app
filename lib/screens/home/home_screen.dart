import 'package:biguenoexpress/widgets/icon_with_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
          actions: <Widget>[
            IconWithCounter(icon: CupertinoIcons.mail, numOfItem: 1, press: () {},),
            IconWithCounter(icon: CupertinoIcons.shopping_cart, numOfItem: 5, press: () {},),
          ],
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
          },
          child: Container(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(6.5),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.search,
                      color: Colors.black,
                    ),
                    Text(
                        'Search...'
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Center(child: Text('DELICIOUS FOOD AT YOUR DOORSTEP', style: TextStyle(color: Colors.white, fontSize: size.height * 0.020),)),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                  color: Colors.blue,
                ),
              ),
              Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 85,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, counter){
                      return Container(
                        width: size.width * 0.28,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: (){},
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CupertinoIcons.house_alt),
                                  Text('Marketplace')
                                ],
                              ),
                              height: 68,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}