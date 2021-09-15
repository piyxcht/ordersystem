import 'package:flutter/material.dart';
import 'package:ordersystemapp/screen/main_rider.dart';
import 'package:ordersystemapp/screen/main_shop.dart';
import 'package:ordersystemapp/screen/main_user.dart';
import 'package:ordersystemapp/screen/signIn.dart';
import 'package:ordersystemapp/screen/signup.dart';
import 'package:ordersystemapp/utility/my_style.dart';
import 'package:ordersystemapp/utility/normal_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    checkPreferacnce();
  }

  Future<Null> checkPreferacnce() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var chooseType = preferences.getString('ChooseType');
      if (chooseType != null && chooseType.isNotEmpty) {
        if (chooseType == 'User') {
          routeToService(MainUser());
        } else if (chooseType == 'Shop') {
          routeToService(MainShop());
        } else if (chooseType == 'Rider') {
          routeToService(MainRider());
        } else {
          normalDialog(context, 'Error user type');
        }
      }
    } catch (e) {}
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => MainUser(),
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[showHead(), sigInMenu(), sighUpMenu()],
        ),
      );

  ListTile sigInMenu() {
    return ListTile(
      leading: Icon(Icons.people),
      title: Text('Sign in'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile sighUpMenu() {
    return ListTile(
      leading: Icon(Icons.people),
      title: Text('Sign up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
        decoration: MyStyle().myBoxDe('guest.jpg'),
        currentAccountPicture: MyStyle().showLogo(),
        accountName: Text('Guest'),
        accountEmail: Text('Pleae Login'));
  }
}
