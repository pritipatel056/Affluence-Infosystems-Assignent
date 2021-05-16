
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

class JsonNotifier extends ChangeNotifier{
  var my_data;

  JsonNotifier() {
    getData();
    }

  Future<String> getJson(){
     return rootBundle.loadString('assets/json_data.json');
  }

  void getData() async{
     my_data = json.decode(await getJson());
     notifyListeners();
  }

}