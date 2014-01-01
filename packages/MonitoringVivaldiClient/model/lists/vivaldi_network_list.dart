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
  
  Uri getUri(){
    return Uri.parse(conf.getAPIURI().toString()+path);
  }
  
  List<VivaldiNetwork> getList(){
    return _networkList;
  }
}