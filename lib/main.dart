import 'package:budget/widget/alert.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, backgroundColor:   Colors.white),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transction = [
    Transaction("Task1", DateTime.now(), "Task1", "36"),
    Transaction("Task2", DateTime.now(), "Task2", "37"),
    Transaction("Task3", DateTime.now(), "Task3", "38")
  ];
  final ttle = TextEditingController();

  final amt = TextEditingController();
  Color Themecolor = Color.fromRGBO(255, 255, 255, 255);

  changecolor() {
    
    setState(() {
      if (Themecolor == Color.fromARGB(50, 50, 50, 200)) {
      Themecolor = Color.fromARGB(255, 255, 255, 255);
    } else {
      Themecolor = Color.fromARGB(50, 50, 50, 200);
    }
    });
  }

  startNewTransaction() {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 500,
                color: Colors.white,
                child: Container(
                  child: AlertDialog(actions: [
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextField(
                        controller: ttle,
                        decoration: InputDecoration(
                            hintText: "Enter title of the task"),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextField(
                        controller: amt,
                        decoration: InputDecoration(
                            hintText: "Enter title of the task"),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        child: Text("Click to add"),
                        onPressed: addTransaction,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          );
        });
  }

  addTransaction() {
    print(ttle.text);
    print(amt.text.toString());
    final newtx = Transaction(
        DateTime.now().day.toString(), DateTime.now(), ttle.text, amt.text);
    setState(() {
      transction.add(newtx);
    });
  }

  remv(value) {
    setState(() {
      transction.remove(transction.last);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themecolor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            /* Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Alert(transaction: transction)));*/
            startNewTransaction();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("My expense monitor"),
          actions: [
            IconButton(
                onPressed: () {
                  remv(transction.last);
                },
                icon: Icon(Icons.remove)),
                
          ],
          leading: IconButton(
                onPressed: () {
                  changecolor();
                },
                icon: Icon(Icons.sunny)
                ),
        ),
        body: Container(
            child: Column(children: [
          // startNewTransaction(),
          /*   Card(
                elevation: 5,
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller: ttle,
                  decoration:
                      InputDecoration(hintText: "Enter title of the task"),
                ),
              ),
              Card(
                elevation: 5,
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller: amt,
                  decoration:
                      InputDecoration(hintText: "Enter title of the task"),
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: Text("Click to add"),
                  onPressed: addTransaction,
                ),
              ),
              */
          transction.isEmpty ?Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
              
                Text("No transaction available",style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.blue[600]
                ),),
                Container(
                  alignment:Alignment.center ,
                  height: MediaQuery.of(context).size.height/2,
                  child: Image.asset("assests/money2.jpeg",fit: BoxFit.fitHeight,),
)],
            ),
          ): Container(
              width: double.infinity,
              height: 500,
              child: ListView.builder(
                  itemCount: transction.length,
                  itemBuilder: (context, intd) {
                    return Container(
                        margin: const EdgeInsets.all(5),
                        height: 100,
                        child: Card(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      transction[intd].amount.toString(),
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent,
                                            style: BorderStyle.solid)),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 5, 5, 5),
                                      child: Text(
                                        transction[intd].title,
                                        style: const TextStyle(
                                            color: Colors.blue, fontSize: 15),
                                      )),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(),
                                width: double.infinity,
                                child: Text(
                                  transction[intd].date.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              // IconButton(onPressed: remv(transction[intd]), icon: Icon(Icons.remove)
                            ])));
                  }))
        ])));
  }
}
