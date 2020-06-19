import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController txNameCtrl = TextEditingController();

  final TextEditingController txAmountCtrl = TextEditingController();
  DateTime _selcteddate;

  void _submitData() {
    if (txNameCtrl.text.isEmpty ||
        txAmountCtrl.text.isEmpty ||
        double.parse(txAmountCtrl.text) < 0) {
      return;
    }

    widget.addTransaction(
      txNameCtrl.text,
      txAmountCtrl.text,
      _selcteddate
    );

    Navigator.of(context).pop();
  }

  _displayDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selcteddate = pickedDate;
      });
    });
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
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _selcteddate == null
                        ? 'Select a Date'
                        : DateFormat.yMMMd().format(_selcteddate),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    onPressed: _displayDatePicker,
                    child: Text('Select a date'),
                    textColor: Colors.purpleAccent,
                  ),
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
