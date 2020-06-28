import 'package:flutter/material.dart';

import '../screens/order-details-screen.dart';

class AppDrawer extends StatelessWidget {
  void _navigateToDrawerMenu(BuildContext ctx, String menu) {
    switch (menu) {
      case 'shopping':
        Navigator.of(ctx).pushReplacementNamed('/');
        break;
      case 'order':
        Navigator.of(ctx).pushReplacementNamed(OrderDetails.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                ListTile(
                  title: Text('Orders'),
                  leading: Icon(Icons.local_shipping),
                  onTap: () => _navigateToDrawerMenu(context, 'order'),
                ),
                ListTile(
                  title: Text('Shopping List'),
                  leading: Icon(Icons.shopping_cart),
                  onTap: () => _navigateToDrawerMenu(context, 'shopping'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
