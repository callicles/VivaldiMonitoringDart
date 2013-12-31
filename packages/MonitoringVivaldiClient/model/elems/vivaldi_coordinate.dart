library vivaldiCoordinate;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_node.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';

class VivaldiCoordinate implements distantElement{
  
  static String path = "/coordinates/";
  
  static Configuration conf;
  
  String _id;
  num _x ;
  num _y ;
  VivaldiNode _node ;
  String _timestamp;
  
  VivaldiCoordinate(Configuration config, String id, num x, num y, VivaldiNode node, String timestamp){
    conf = config;
    _id = id;
    _x = x;
    _y = y;
    _node = node;
    _timestamp = timestamp;
  }
  
  void update(){
  }
  
  String getPath(){
    return ""+conf.getAPIURI()+path+_id;
  }
}