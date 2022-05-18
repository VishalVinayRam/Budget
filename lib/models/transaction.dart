
import 'package:flutter/widgets.dart';

class Transaction {
  final String id;
  final DateTime date;
  final String title;
  final String amount;

  Transaction(@required this.id, @required this.date,@required this.title,@required this.amount);
}
