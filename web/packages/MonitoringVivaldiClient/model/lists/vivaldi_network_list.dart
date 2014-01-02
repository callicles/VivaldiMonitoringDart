library vivaldiNetworkList;

import 'dart:html';
import 'dart:convert';

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_network.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';
import 'package:MonitoringVivaldiClient/model/model.dart';

class VivaldiNetworkList implements distantElement {
  
  static String path = "/networks/";
  
  List<VivaldiNetwork> _networkList;
  
  VivaldiNetworkList(){     
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
  
  List<VivaldiNetwork> getList(){
    return _networkList;
  }
  
  void updateList(HttpRequest req){
    if (req.status == 200){
      print(JSON.decode(req.responseText));
    }else {
      print("Error on Request : "+req.status.toString());
    }
  }
}