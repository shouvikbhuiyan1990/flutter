import 'package:flutter/material.dart';

import '../screens/order-details-screen.dart';
import '../screens/manage-products-screen.dart';

class AppDrawer extends StatelessWidget {
  void _navigateToDrawerMenu(BuildContext ctx, String menu) {
    switch (menu) {
      case 'shopping':
        Navigator.of(ctx).pushReplacementNamed('/');
        break;
      case 'order':
        Navigator.of(ctx).pushReplacementNamed(OrderDetails.routeName);
        break;
      case 'manageProducts':
        Navigator.of(ctx).pushReplacementNamed(ManageProducts.routeName);
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
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome, Guest',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
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
                ),
                ListTile(
                  title: Text('Manage Products'),
                  leading: Icon(Icons.build),
                  onTap: () => _navigateToDrawerMenu(context, 'manageProducts'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
