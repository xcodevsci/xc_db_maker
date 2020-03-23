import 'package:flutter/material.dart';
import 'package:xc_db_maker_example/app_db.dart';
import 'package:xc_db_maker_example/entities/client.dart';
import 'package:xc_db_maker_example/models/pdo_manager.dart';

void main() {
  appDb.xcDBInit(); // Initialize and create in memory db
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'XC DB Marker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  EntityPdoManager entityPdoManager = EntityPdoManager.instance;
  Client newClient  = Client(
    fullname: "TINA K. Arouna",
    city: "Abidjan",
    country: "Côte d'ivoire",
    address: "Cocody angré - xcodevs corporation"
  );

  @override
  void initState() {
    appDb.onDbCloseCallback = _onDbClose;
    super.initState();
  }
  @override
  void dispose() {
    appDb.closeDb();
    super.dispose();
  }

  _onDbClose() async{
    print("DATABASE IS CLOSED");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Smart db creator:',
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: MaterialButton(
                onPressed: (){
                  entityPdoManager.addClient(newClient);
                  debugPrint("Client added");
                },
                child: Text("Add Client"),
              )
            ),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: MaterialButton(
                  onPressed: (){
                    entityPdoManager.deleteAllClient();
                    debugPrint("Clients deleted");
                  },
                  child: Text("Delete all Client"),
                )
            )
          ],
        ),
      ),
    );
  }
}
