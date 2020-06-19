import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './model/transaction.dart';
import './widgets/chart.dart';

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
    Transactions(
        id: DateTime.now().toString(),
        amount: 12.00,
        txName: 'Transaction Name',
        time: DateTime.now()),
    Transactions(
        id: DateTime.now().toString(),
        amount: 12.00,
        txName: 'Second Name',
        time: DateTime.now()),
    Transactions(
        id: DateTime.now().toString(),
        amount: 12.00,
        txName: 'third Name',
        time: DateTime.now()),
  ];

  List<Transactions> getRecentTransactions() {
    List<Transactions> pastTx = transactions.where((element) {
      Duration difference = element.time.difference(DateTime.now());
      if (difference.inDays < 7) {
        return true;
      } else {
        return false;
      }
    }).toList();

    return pastTx;
  }

  void _addNewTransaction(name, amount) {
    setState(() {
      transactions.add(Transactions(
        amount: double.parse(amount),
        id: DateTime.now().toString(),
        txName: name,
        time: DateTime.now(),
      ));
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: BarChartSample1(getRecentTransactions()),
            ),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
