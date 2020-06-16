import 'package:flutter/material.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionList(this.transactions);

  _buildTransactionCard(tx) {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            Text(tx.txName),
            Column(
              children: <Widget>[
                Text(tx.txName),
                Text(tx.txName),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (BuildContext ctxt, int i) {
            return _buildTransactionCard(transactions[i]);
          }),
    );
  }
}
