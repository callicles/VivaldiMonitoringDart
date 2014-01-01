library vivaldiNode;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_network.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';

class VivaldiNode implements distantElement{
  
  static String path = "/nodes/";
  
  static Configuration conf;
  
  String _id;
  String _path;
  VivaldiNetwork _network;
  
  VivaldiNode(Configuration config, String id, String path, VivaldiNetwork network){
    conf = config;
    _id = id;
    _path = path;
    _network = network;
  }
  
  void update(){
  }
  
  Uri getUri(){
    return Uri.parse(conf.getAPIURI().toString()+path+_id);
  }
}