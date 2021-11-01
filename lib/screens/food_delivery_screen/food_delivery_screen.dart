import 'package:biguenoexpress/controllers/product_controller.dart';
import 'package:biguenoexpress/controllers/seller_controller.dart';
import 'package:biguenoexpress/models/products.dart';
import 'package:biguenoexpress/models/sellers.dart';
import 'package:biguenoexpress/widgets/icon_with_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FoodDeliveryScreen extends StatelessWidget {
  final SellerController sellerController = Get.put(SellerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
        centerTitle: true,
        actions: [
          IconWithCounter(
            numOfItem: 9,
            icon: CupertinoIcons.shopping_cart,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoSearchTextField(
                  placeholder: 'Search for shops and restaurant',
                  onChanged: (String value) {
                    print('The text has changed to: $value');
                  },
                  onSubmitted: (String value) {
                    print('Submitted text: $value');
                  },
                ),
                SizedBox(height: 15,),
                Text('Featured', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 18),),
                Container(
                  height: 210,
                  child: Obx(() {
                    if (sellerController.isLoading.value)
                      return Center(child: CupertinoActivityIndicator());
                    else
                      return StaggeredGridView.countBuilder(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 1,
                        itemCount: sellerController.sellerList.length,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          return SellerTile(sellerController.sellerList[index]);
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      );
                  }),
                ),
                SizedBox(height: 15,),
                Text('Your Daily Deals', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 18),),
                Container(
                  height: 210,
                  child: Obx(() {
                    if (sellerController.isLoading.value)
                      return Center(child: CupertinoActivityIndicator());
                    else
                      return StaggeredGridView.countBuilder(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 1,
                        itemCount: sellerController.sellerList.length,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              child: SellerTile(sellerController.sellerList[index]));
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      );
                  }),
                ),
                SizedBox(height: 15,),
                Text('All Stores', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 18),),
                Obx(() {
                    if (sellerController.isLoading.value)
                      return Center(child: CupertinoActivityIndicator());
                    else
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: sellerController.sellerList.length,
                          itemBuilder: (context, int index) {
                          return SellerTile(sellerController.sellerList[index]);
                        }
                      );
                  }),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class SellerTile extends StatelessWidget {
  final Sellers sellers;
  const SellerTile(this.sellers);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print(sellers.id);
          },
          child: Container(
            width: 250,
            height: 148,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    image: NetworkImage(sellers.img)
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6, right: 16, top: 6, bottom: 6),
                          child: Text('${sellers.discountPercent} % OFF', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(CupertinoIcons.heart, size: 18,),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 6),
                      child: Text(sellers.preparationTime, style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        sellers.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.star_fill, size: 16, color: Colors.blue,),
                        Text(
                          '${sellers.rating}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                        Text(
                          ' ( ${sellers.rateCount} )',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),)
                      ],
                    )
                  ],
                ),
                Text('\u20B1 \u20B1 • ${sellers.category}', style: TextStyle(fontWeight: FontWeight.w300),),
                Row(
                  children: [
                    Icon(Icons.directions_bike, size: 18,),
                    SizedBox(width: 10,),
                    Text('\u20B1 ${sellers.devFee}', style: TextStyle(fontWeight: FontWeight.w300),),
                  ],
                )
              ],
            )
        ),
      ],
    );
  }
}
