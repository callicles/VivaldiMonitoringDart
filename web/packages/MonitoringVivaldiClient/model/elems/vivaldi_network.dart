library vivaldiNetwork;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';

class VivaldiNetwork implements distantElement{
  
  static String path = "/networks/";
  
  static Configuration conf;
  
  String _id;
  String _name;
  
  VivaldiNetwork(Configuration config, String id, String name){
    conf = config;
    _id = id;
    _name = name;
  }
  
  void update(){
  }
  
  Uri getUri(){
    return Uri.parse(conf.getAPIURI().toString()+path+_id);
  }
}