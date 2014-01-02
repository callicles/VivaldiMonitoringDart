library vivaldiNodeList;

import 'dart:html';
import 'dart:convert';

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_node.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';
import 'package:MonitoringVivaldiClient/model/model.dart';

class VivaldiNodeList implements distantElement {
  
  static String path = "/nodes/";
  
  List<VivaldiNode> _nodeList;
  
  VivaldiNodeList(){      
  }
  
  void update(){
    HttpRequest req = new HttpRequest();
    
    req
    ..open('GET', getUri().toString(), async: true , user: Model.config.getAPILogin(), password: Model.config.getAPIPassword())
    ..onLoadEnd.listen((e) => updateList(req))
    ..send("");
  }
  
  Uri getUri(){
    return Uri.parse(Model.config.getAPIURI().toString()+path);
  }
  
  List<VivaldiNode> getList(){
    return _nodeList;
  }
  
  void updateList(HttpRequest req){
    if (req.status == 200){
      print(JSON.decode(req.responseText));
    }else {
      print("Error on Request : "+req.status.toString());
    }
  }
}