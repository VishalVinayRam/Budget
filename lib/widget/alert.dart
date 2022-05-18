import 'package:flutter/material.dart';
import '../models/transaction.dart';

class Alert extends StatefulWidget {
  final List<Transaction> transaction;
  const Alert({Key? key, required this.transaction}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState(transaction);
}

class _AlertState extends State<Alert> {
  @override
  final ttle = TextEditingController();

  final amt = TextEditingController();
  final List<Transaction> transaction;

  _AlertState(this.transaction);

  addTransaction() {
    print(ttle);
    print(amt.toString());
    setState(() {
      transaction.add(Transaction(
        DateTime.now().day.toString(), DateTime.now(), ttle.text, amt.text));
    Navigator.of(context).pop();
    });
    
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AlertDialog(actions: [
        Card(
          elevation: 5,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: TextField(
            controller: ttle,
            decoration: InputDecoration(hintText: "Enter title of the task"),
          ),
        ),
        Card(
          elevation: 5,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: TextField(
            controller: amt,
            decoration: InputDecoration(hintText: "Enter title of the task"),
          ),
        ),
        Container(
          child: ElevatedButton(
            child: Text("Click to add"),
            onPressed: addTransaction,
          ),
        ),
      ]),
    );
  }
}
