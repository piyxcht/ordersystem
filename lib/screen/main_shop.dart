import 'package:flutter/material.dart';
import 'package:ordersystemapp/utility/my_style.dart';
import 'package:ordersystemapp/utility/signout_process.dart';
import 'package:ordersystemapp/widget/info_shop.dart';
import 'package:ordersystemapp/widget/list_food_manu_shop.dart';
import 'package:ordersystemapp/widget/order_list_shop.dart';

class MainShop extends StatefulWidget {
  const MainShop({Key? key}) : super(key: key);

  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  //field
  Widget currentWidget = OrderListShop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Shop'),
        actions: <Widget>[
          IconButton(
              onPressed: () => signOutProcess(context),
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            homeMenu(),
            foodMenu(),
            informationMenu(),
            signOutMenu(),
          ],
        ),
      );

  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('รายการอาหารที่ลูกค้าสั่ง'),
        subtitle: Text('รายการอาหารที่ยังไม่ทำ'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile foodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('รายการอาหาร'),
        subtitle: Text('รายการอาหารของร้าน'),
        onTap: () {
          setState(() {
            currentWidget = ListFoodMenuShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile informationMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('รายละเอียดของร้าน'),
        subtitle: Text('รายละเอียดของร้าน พร้อม Edit'),
        onTap: () {
          setState(() {
            currentWidget = InfoShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile signOutMenu() => ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Sign out'),
        subtitle: Text('Sign outและกลับไปยังหน้าแรก'),
        onTap: () => signOutProcess(context),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
        decoration: MyStyle().myBoxDe('shop.jpg'),
        currentAccountPicture: MyStyle().showLogo(),
        accountName: Text(
          'Name Shop',
          style: TextStyle(color: MyStyle().darkColor),
        ),
        accountEmail: Text(
          'Login',
          style: TextStyle(color: MyStyle().primaryColoer),
        ));
  }
}
