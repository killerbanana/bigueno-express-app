import 'package:biguenoexpress/controllers/product_controller.dart';
import 'package:biguenoexpress/models/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  static String routeName = "/homepage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Food Delivery',style: TextStyle(
            fontFamily: 'avenir',
            fontSize: 20,
            fontWeight: FontWeight.w900),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            Row(
                children: [
                  Expanded(
                    child: Text(
                      'Your Daily deals',
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.view_list_rounded), onPressed: () {

                  }),
                  IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
                ],
            ),
            Expanded(
              child: Obx(() {
                if (productController.isLoading.value)
                  return Center(child: CupertinoActivityIndicator());
                else
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemCount: productController.productList.length,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
              }),
            )
          ],
        ),
      ),
    );
  }
}