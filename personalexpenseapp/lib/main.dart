import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './model/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExpenseContainer(),
    );
  }
}

class ExpenseContainer extends StatefulWidget {
  @override
  _ExpenseContainerState createState() => _ExpenseContainerState();
}

class _ExpenseContainerState extends State<ExpenseContainer> {
  final List<Transactions> transactions = [
    Transactions(id: DateTime.now().toString(), amount: 12.00, txName: 'Transaction Name', time:DateTime.now() ),
    Transactions(id: DateTime.now().toString(), amount: 12.00, txName: 'Second Name', time:DateTime.now() ),
    Transactions(id: DateTime.now().toString(), amount: 12.00, txName: 'third Name', time:DateTime.now() ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              NewTransaction(),
              TransactionList(transactions)
            ],
          ),
        ),
      ),
    );
  }
}
