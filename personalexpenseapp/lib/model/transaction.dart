import 'package:flutter/material.dart';

class Transactions {
  @required final String id;
  @required final String txName;
  @required final double amount;
  @required final DateTime time;

  Transactions({this.id, this.txName, this.amount, this.time});
}