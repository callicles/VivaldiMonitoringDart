library vivaldiNode;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_network.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';
import 'package:MonitoringVivaldiClient/model/model.dart';

class VivaldiNode implements distantElement{
  
  static String path = "/nodes/";
  
  String _id;
  String _path;
  VivaldiNetwork _network;
  
  VivaldiNode(String id, String path, VivaldiNetwork network){
    _id = id;
    _path = path;
    _network = network;
  }
  
  void update(){
  }
  
  Uri getUri(){
    return Uri.parse(Model.config.getAPIURI().toString()+path+_id);
  }
}