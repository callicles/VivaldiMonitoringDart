library vivaldiNodeList;

import 'dart:html';
import 'dart:convert';

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_node.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';

class VivaldiNodeList implements distantElement {
  
  static String path = "/nodes/";
  
  Configuration conf;
  
  List<VivaldiNode> _nodeList;
  
  VivaldiNodeList(Configuration config){
    conf = config;      
  }
  
  void update(){
    HttpRequest req = new HttpRequest();
    
    req
    ..open('GET', getUri().toString(), async: true , user: conf.getAPILogin(), password: conf.getAPIPassword())
    ..onLoadEnd.listen((e) => updateList(req))
    ..send("");
  }
  
  Uri getUri(){
    return Uri.parse(conf.getAPIURI().toString()+path);
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