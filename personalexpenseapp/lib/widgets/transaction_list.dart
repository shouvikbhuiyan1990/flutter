import 'package:flutter/material.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionList(this.transactions);

  _buildTransactionCard(tx) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              '\$${tx.amount.toString()}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(tx.txName,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    )),
                Text(
                  tx.time.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
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
