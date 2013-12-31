library vivaldiNetworkList;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_network.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';

class VivaldiNetworkList implements distantElement {
  
  static String path = "/networks/";
  
  static Configuration conf;
  
  List<VivaldiNetwork> _networkList;
  
  VivaldiNetworkList(Configuration conf){
    conf = conf;      
  }
  
  void update(){
    
  }
  
  String getPath(){
    return ""+conf.getAPIURI()+path;
  }
  
  List<VivaldiNetwork> getList(){
    return _networkList;
  }
}