import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ordersystemapp/model/user_model.dart';
import 'package:ordersystemapp/screen/main_rider.dart';
import 'package:ordersystemapp/screen/main_shop.dart';
import 'package:ordersystemapp/screen/main_user.dart';
import 'package:ordersystemapp/utility/my_style.dart';
import 'package:ordersystemapp/utility/normal_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Field
  var user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, MyStyle().primaryColoer],
            center: Alignment(0, -0.3),
            radius: 1.0,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().mySizebox(),
                MyStyle().showTitle('Order System'),
                MyStyle().mySizebox(),
                userForm(),
                MyStyle().mySizebox(),
                passwordForm(),
                MyStyle().mySizebox(),
                loginButtom()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButtom() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        color: MyStyle().darkColor,
        onPressed: () {
          if (user == null ||
              user.isEmpty ||
              password == null ||
              password.isEmpty) {
            normalDialog(context, 'กรุณากรอกข้อมูล');
          } else {
            checkAuthen();
          }
        },
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<Null> checkAuthen() async {
    String url =
        'http://192.168.56.1/ordersystem/getUserWhereUser.php?isAdd=true&User=$user';
    try {
      Response response = await Dio().get(url);
      print('res = $response');

      var result = json.decode(response.data);
      print('result = $result');
      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        if (password == userModel.password) {
          var chooseType = userModel.chooseType;
          if (chooseType == 'User') {
            routeToSevice(MainUser(), userModel);
          } else if (chooseType == 'Shop') {
            routeToSevice(MainShop(), userModel);
          } else if (chooseType == 'Rider') {
            routeToSevice(MainRider(), userModel);
          } else {
            normalDialog(context, 'Error');
          }
        } else {
          normalDialog(context, 'Password ไม่ถูกต้อง');
        }
      }
    } catch (e) {}
  }

  Future<Null> routeToSevice(Widget myWidget, UserModel userModel) async {

    

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('id', userModel.id);
    preferences.setString('ChooseType', userModel.chooseType);
    preferences.setString('Name', userModel.name);

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'User :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColoer)),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'Password :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColoer)),
          ),
        ),
      );
}
