import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.blueGrey;
  Color primaryColoer = Colors.brown;

  TextStyle mainTitle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.purple);

  TextStyle mainH2Title = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.brown.shade400,
  );

  BoxDecoration myBoxDe(String namePic) {
    return BoxDecoration(
        image: DecorationImage(
      image: AssetImage('images/$namePic'),
      fit: BoxFit.cover,
    ));
  }

  SizedBox mySizebox() => SizedBox(
        width: 6.0,
        height: 15.0,
      );

  Widget titleCenter(BuildContext context, String string) {
    return Center(
      child: Container(width: MediaQuery.of(context).size.width*0.5,
        child: Text(
          string,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      );

  Text showTitleH2(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      );

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  MyStyle();
}
