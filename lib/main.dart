import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/Jsonnotifier.dart';
import 'package:provider/provider.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (BuildContext context)=> JsonNotifier(),
    child: Scaffold(
      body: JsonData(),
    ),);
  }
}
class JsonData extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return Consumer<JsonNotifier>(
  builder:(BuildContext context,JsonNotifier value,Widget child){
    if(value==null){
      print('loading data');
    }
    return value!=null? Scaffold(
      appBar: AppBar(
        title: Text("Loading Local JsonData"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: value.my_data!=null?value.my_data.length:0,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('id: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                          Text(' ${value.my_data[index]['id']}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text('Name: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                          Text(' ${value.my_data[index]['name']}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Divider()
                    ],
                  ),
                );
              }),
        ),
      ),
    ):Scaffold(
      body: Center(
        child: Text('Loading Data'),
      ),

    );
  },
);
  }

}
