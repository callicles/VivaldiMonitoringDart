library vivaldiNodeList;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_node.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';

class VivaldiNodeList implements distantElement {
  
  static String path = "/nodes/";
  
  static Configuration conf;
  
  List<VivaldiNode> _nodeList;
  
  VivaldiNodeList(Configuration conf){
    conf = conf;      
  }
  
  void update(){
    
  }
  
  String getPath(){
    return ""+conf.getAPIURI()+path;
  }
  
  List<VivaldiNode> getList(){
    return _nodeList;
  }
}