import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final txNameCtrl = TextEditingController();
  final txAmountCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Card(
              child: TextField(
                controller: txNameCtrl,
                decoration: InputDecoration(labelText: 'Transaction Name'),
              ),
            ),
            Card(
              child: TextField(
                controller: txAmountCtrl,
                decoration: InputDecoration(labelText: 'Transaction Amount'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textColor: Colors.purpleAccent,
            )
          ],
        ),
      ),
    );
  }
}
