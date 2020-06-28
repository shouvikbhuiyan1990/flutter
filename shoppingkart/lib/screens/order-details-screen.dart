import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/order.dart';
import '../widgets/app-drawer.dart';

class OrderDetails extends StatelessWidget {
  static String routeName = '/order-details';
  @override
  Widget build(BuildContext context) {
    var orderProvider = Provider.of<Order>(context);
    List<OrderItem> loadedOrders = orderProvider.getAllOrders;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        // automaticallyImplyLeading: false,//disable the automatic back button
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                if (loadedOrders.length == 0)
                  Center(
                    child: Text('No Orders Placed Yet'),
                  )
                else if (loadedOrders.length > 0)
                  ...loadedOrders.map((e) => Text('loaded'))
              ],
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
