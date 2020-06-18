import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController txNameCtrl = TextEditingController();

  final TextEditingController txAmountCtrl = TextEditingController();

  void _submitData() {
    if (txNameCtrl.text.isEmpty || txAmountCtrl.text.isEmpty || double.parse(txAmountCtrl.text) < 0 ) {
      return;
    }

    widget.addTransaction(
      txNameCtrl.text,
      txAmountCtrl.text,
    );

    Navigator.of(context).pop();
  }

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
              onPressed: _submitData,
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
