import 'package:biguenoexpress/widgets/rounded_button.dart';
import 'package:biguenoexpress/widgets/text_inputfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Add Product'),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                TextInputField(hint: "Enter product name", icon: CupertinoIcons.shopping_cart, inputAction: TextInputAction.next, color: Colors.blue[300], iconColor: Colors.black,),
                TextInputField(hint: "Enter product description", icon: CupertinoIcons.pen, inputAction: TextInputAction.next, color: Colors.blue[300], iconColor: Colors.black),
                TextInputField(hint: "Category", icon: CupertinoIcons.list_bullet, inputAction: TextInputAction.next, color: Colors.blue[300], iconColor: Colors.black),
                TextInputField(hint: "Price", icon: CupertinoIcons.tag, inputAction: TextInputAction.next, color: Colors.blue[300], iconColor: Colors.black),
                TextInputField(hint: "Stock", icon: CupertinoIcons.chart_bar, inputAction: TextInputAction.next, color: Colors.blue[300], iconColor: Colors.black),
                SizedBox(height: 10,),
                RoundedButton(btnText: "Add Product",)
              ],
            ),
          )
        ],
      )
    );
  }
}
