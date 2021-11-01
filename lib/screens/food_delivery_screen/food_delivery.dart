import 'package:biguenoexpress/controllers/product_controller.dart';
import 'package:biguenoexpress/models/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FoodDelivery extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Food Delivery'),
        ),
      child: CupertinoScrollbar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
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
                SizedBox(height: 10,),
                Expanded(
                  child: Obx(() {
                    if (productController.isLoading.value)
                      return Center(child: CupertinoActivityIndicator());
                    else
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: productController.productList.length,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        itemBuilder: (context, index) {
                          return ProductTile(productController.productList[index]);
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      );
                  }),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
