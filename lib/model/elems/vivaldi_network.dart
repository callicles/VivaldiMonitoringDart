library vivaldiNetwork;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';
import 'package:MonitoringVivaldiClient/model/model.dart';

class VivaldiNetwork implements distantElement{
  
  static String path = "/networks/";
  
  String _id;
  String _name;
  
  VivaldiNetwork(String id, String name){
    _id = id;
    _name = name;
  }
  
  void update(){
  }
  
  Uri getUri(){
    return Uri.parse(Model.config.getAPIURI().toString()+path+_id);
  }
}