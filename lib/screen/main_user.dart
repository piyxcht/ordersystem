import 'package:flutter/material.dart';
import 'package:ordersystemapp/main.dart';
import 'package:ordersystemapp/utility/my_style.dart';
import 'package:ordersystemapp/utility/signout_process.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUser extends StatefulWidget {
  const MainUser({Key? key}) : super(key: key);

  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  var nameUser;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('Name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameUser == null ? 'Main User' : '$nameUser login'),
        actions: <Widget>[
          IconButton(
              onPressed: () => signOutProcess(context), icon: Icon(Icons.exit_to_app))
        ],
      ),
      drawer: showDrawer(),
    );
  }
}

Drawer showDrawer() => Drawer(
      child: ListView(
        children: <Widget>[
          showHead(),
        ],
      ),
    );

UserAccountsDrawerHeader showHead() {
  return UserAccountsDrawerHeader(decoration: MyStyle().myBoxDe('user.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Name Login'),
      accountEmail: Text('Login'));
}
