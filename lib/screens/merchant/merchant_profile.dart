import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MerchantProfile extends StatelessWidget{
  static String routeName = "/merchantProfile";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.settings,
              color: Colors.orange,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.chat_bubble,
              color: Colors.orange,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage("https://wallpaperaccess.com/full/5713760.jpg"),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('My Shop', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('Following 5', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),),
                            VerticalDivider(),
                            Text('Followers 13', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            SellerProfileButton(title: "My Sales", isNew: false, iconColor: Colors.blueAccent, iconData: CupertinoIcons.list_dash, subTitle: "View Sales History",),
            Divider(height: 1,),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SalesActionButton(iconData: CupertinoIcons.cube_box, title: "To Deliver",),
                  SalesActionButton(iconData: CupertinoIcons.delete_right, title: "Cancelled",),
                  SalesActionButton(iconData: CupertinoIcons.bars, title: "More",),
                ],
              ),
            ),
            Divider(),
            SellerProfileButton(title: "My Products", isNew: false, iconColor: Colors.redAccent, iconData: CupertinoIcons.cube_box, subTitle: "",),
            SellerProfileButton(title: "Add New Products", isNew: false, iconColor: Colors.redAccent, iconData: CupertinoIcons.add_circled, subTitle: "",),
            Divider(),
            SellerProfileButton(title: "Seller Balance", isNew: false, iconColor: Colors.redAccent, iconData: CupertinoIcons.creditcard, subTitle: "\u20B1 0",),
            Divider(height: 1,),
            SellerProfileButton(title: "My income", isNew: false, iconColor: Colors.orangeAccent, iconData: CupertinoIcons.archivebox, subTitle: "",),
            Divider(height: 1,),
            SellerProfileButton(title: "My Delivery", isNew: false, iconColor: Colors.blueAccent, iconData: CupertinoIcons.bus, subTitle: "",),
            Divider(height: 1,),
            SellerProfileButton(title: "Shop Rating", isNew: false, iconColor: Colors.greenAccent, iconData: CupertinoIcons.star, subTitle: "",),
            Divider(height: 1,),
            SellerProfileButton(title: "Chat with Bigueno Express", isNew: false, iconColor: Colors.redAccent, iconData: CupertinoIcons.chat_bubble_2, subTitle: "",),
            Divider(),
            SellerProfileButton(title: "View My Shop", isNew: false, iconColor: Colors.redAccent, iconData: CupertinoIcons.eye, subTitle: "biguenoexpress.ph/josh.rosqueta",),
          ],
        ),
      ),
    );
  }
}

class SalesActionButton extends StatelessWidget {
  const SalesActionButton({
    Key key, @required this.title, @required this.iconData,
  }) : super(key: key);

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Column(
      children: [
        Icon(iconData, color: Colors.black45,),
        Text(title,style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.black),),
      ],
    ), style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.white
    ),);
  }
}

class SellerProfileButton extends StatelessWidget {
  const SellerProfileButton({
    Key key, @required this.title, @required this.isNew, @required this.iconData, @required this.iconColor, @required this.subTitle,
  }) : super(key: key);

  final String title;
  final bool isNew;
  final IconData iconData;
  final Color iconColor;
  final String subTitle;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: Colors.white
      ),
      onPressed: () {},
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(iconData, color: iconColor,),
                SizedBox(width: 10,),
                Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black87),),
                SizedBox(width: 10,),
                if(isNew)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('New',style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Colors.white),),
                    ),
                  )
              ],
            ),
            Row(
              children: [
                Text(subTitle,style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.black),),
                Icon(CupertinoIcons.forward, color: Colors.black45,)
              ],
            )
          ],
        ),
      ),
    );
  }
}