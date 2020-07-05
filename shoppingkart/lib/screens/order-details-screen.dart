import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/order.dart';
import '../widgets/app-drawer.dart';
import '../widgets/order-item.dart' as orderWidget;

class OrderDetails extends StatefulWidget {
  static String routeName = '/order-details';

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool _isInitiated = false;
  bool _setLoader = false;
  @override
  void didChangeDependencies() {
    final orderProvider = Provider.of<Order>(context, listen: false);
    if (!_isInitiated) {
      setState(() {
        _setLoader = true;
      });
      orderProvider.getAndSetOrders().then((value) {
        setState(() {
          _setLoader = false;
        });
      });
      _isInitiated = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<Order>(context, listen: false);
    final List<OrderItem> loadedOrders = orderProvider.getAllOrders;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        // automaticallyImplyLeading: false,//disable the automatic back button
      ),
      body: _setLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      if (loadedOrders.length == 0)
                        Center(
                          child: Text('No Orders Placed Yet'),
                        )
                      else if (loadedOrders.length > 0)
                        ...loadedOrders.map((e) => orderWidget.OrderItem(
                              e.orderValue,
                              e.orderTime,
                              e.orderProducts,
                            ))
                    ],
                  ),
                ),
              ),
            ),
      drawer: AppDrawer(),
    );
  }
}
