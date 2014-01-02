library vivaldiInitTime;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_node.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';
import 'package:MonitoringVivaldiClient/model/model.dart';

class VivaldiInitTime implements distantElement{
  
  static String path = "/initTime/";
  
  String _id;
  String _timestamp;
  VivaldiNode _node;
  
  VivaldiInitTime(String id, String timestamp, VivaldiNode node){
    _id = id;
    _timestamp = timestamp;
    _node = node;
  }
  
  void update(){
  }
  
  Uri getUri(){
    return Uri.parse(Model.config.getAPIURI().toString()+path+_id);
  }
}