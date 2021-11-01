import 'package:biguenoexpress/models/products.dart';
import 'package:biguenoexpress/models/sellers.dart';
import 'package:biguenoexpress/widgets/icon_with_counter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class FoodDeliverySellerScreen extends StatefulWidget {
  static String routeName = "/seller_screen";

  @override
  _FoodDeliverySellerScreenState createState() => _FoodDeliverySellerScreenState();


}

class _FoodDeliverySellerScreenState extends State<FoodDeliverySellerScreen> {

  List category = [];
  CollectionReference promos =
  FirebaseFirestore.instance.collection('products');

  readCategory() async {
    setState(() {
    });

    Map<String, dynamic> cate;

    await FirebaseFirestore.instance
        .collection('seller')
        .doc('JKjFk5ApOjwt7csgFvnG')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        cate = documentSnapshot.data();

        category = cate["store_category"];
      }
    });
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating : true,
            pinned : true,
            actions: [
              IconWithCounter(icon: CupertinoIcons.cart, numOfItem: 9, press: () {},)
            ],
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Jollibee - Bantay'),
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://i.insider.com/57ee7fe911c8e79c0b8b4679?width=1000&format=jpeg&auto=webp',
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white)
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Delivery: 25 mins',
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
                                ),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.star_fill, color: Colors.white, size: 16,),
                              Text('4.6', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),),
                              Text(' ( 21 ) ', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),)
                            ],
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: ScrollableListTabView(
              tabHeight: 48,
              bodyAnimationDuration: const Duration(milliseconds: 150),
              tabAnimationCurve: Curves.easeOut,
              tabAnimationDuration: const Duration(milliseconds: 200),
              tabs: [
                for(int x = 0; x < category.length; x++)
                  ScrollableListTab(
                    tab: ListTab(
                        label: Center(child: Text('${category[x]}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),)),
                        showIconOnList: false),
                    body: CustomScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      slivers: [
                        SliverToBoxAdapter(
                          child: FutureBuilder<QuerySnapshot>(
                            future: promos.where("seller_id", isEqualTo: "JKjFk5ApOjwt7csgFvnG").get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              }

                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CupertinoActivityIndicator();
                              }
                              print(category.length);
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.size,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                        children: snapshot.data.docs.map((DocumentSnapshot document) {
                                          Map<String, dynamic> cate = document.data();
                                          Map<String, dynamic> productData = cate["product_data"];
                                          Map<String, dynamic> sellerData = productData["seller_data"];

                                          return Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(productData["name"], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                        Text('from \u20B1  ${productData["price"]} ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                            image: NetworkImage("${productData["image"]}"))
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(),
                                              ],
                                            ),
                                          );
                                      }).toList()),
                                    );
                                  }
                              );
                            }
                          )
                        )
                      ],
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    readCategory();
  }
}
