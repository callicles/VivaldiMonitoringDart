library vivaldiInitTime;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_node.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';

class VivaldiInitTime implements distantElement{
  
  static String path = "/initTime/";
  
  static Configuration conf;
  
  String _id;
  String _timestamp;
  VivaldiNode _node;
  
  VivaldiInitTime(Configuration config, String id, String timestamp, VivaldiNode node){
    conf = config;
    _id = id;
    _timestamp = timestamp;
    _node = node;
  }
  
  void update(){
  }
  
  Uri getUri(){
    return Uri.parse(conf.getAPIURI().toString()+path+_id);
  }
}