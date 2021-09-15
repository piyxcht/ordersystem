import 'package:flutter/material.dart';
import 'package:ordersystemapp/screen/add_info_shop.dart';
import 'package:ordersystemapp/utility/my_style.dart';

class InfoShop extends StatefulWidget {
  const InfoShop({Key? key}) : super(key: key);

  @override
  _InfoShopState createState() => _InfoShopState();
}

class _InfoShopState extends State<InfoShop> {
  void routeToAddInfo(BuildContext context) {
    print('routeToAddInfo Work');
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (context) => AddInfoShop(),
    );
    Navigator.push(context, materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MyStyle().titleCenter(context, 'ยังไม่มีข้อมูล กรุณาเพิ่มข้อมูล'),
        addAndEditButtom(),
      ],
    );
  }

  Row addAndEditButtom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () {
                  print('you click floating');
                  routeToAddInfo(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
