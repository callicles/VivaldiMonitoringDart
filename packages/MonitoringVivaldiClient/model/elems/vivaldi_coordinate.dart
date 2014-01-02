library vivaldiCoordinate;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_node.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';
import 'package:MonitoringVivaldiClient/model/model.dart';

class VivaldiCoordinate implements distantElement{
  
  static String path = "/coordinates/";
  
  String _id;
  num _x ;
  num _y ;
  VivaldiNode _node ;
  String _timestamp;
  
  VivaldiCoordinate(String id, num x, num y, VivaldiNode node, String timestamp){
    _id = id;
    _x = x;
    _y = y;
    _node = node;
    _timestamp = timestamp;
  }
  
  void update(){
  }
  
  Uri getUri(){
    return Uri.parse(Model.config.getAPIURI().toString()+path+_id);
  }
}