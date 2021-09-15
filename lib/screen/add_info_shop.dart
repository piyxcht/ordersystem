import 'package:flutter/material.dart';
import 'package:ordersystemapp/utility/my_style.dart';

class AddInfoShop extends StatefulWidget {
  const AddInfoShop({Key? key}) : super(key: key);

  @override
  _AddInfoShopState createState() => _AddInfoShopState();
}

class _AddInfoShopState extends State<AddInfoShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Information Shop'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyStyle().mySizebox(),
            nameForm(),
            MyStyle().mySizebox(),
            addressForm(),
            MyStyle().mySizebox(),
            phoneForm(),
            MyStyle().mySizebox(),
            groupImage(),
            MyStyle().mySizebox(),
            saveButtom()
          ],
        ),
      ),
    );
  }

  RaisedButton saveButtom() {
    return RaisedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.save),
            label: Text('Save Information'),
          );
  }

  Row groupImage() {
    return Row(
      children: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_a_photo,
              size: 36.0,
            )),
        Container(
          width: 250.0,
          child: Image.asset('images/photo.png'),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_photo_alternate,
              size: 36.0,
            )),
      ],
    );
  }

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Name Shop',
                prefixIcon: Icon(Icons.account_box),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget addressForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Address Shop',
                prefixIcon: Icon(Icons.house),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget phoneForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Shop',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
}
