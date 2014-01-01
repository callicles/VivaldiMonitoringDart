library vivaldiCoordinateList;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_coordinate.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';

class VivaldiCoordinateList implements distantElement {
  
  static String path = "/coordinates/";
  
  static Configuration conf;
  
  List<VivaldiCoordinate> _coordinateList;
  
  VivaldiCoordinateList(Configuration conf){
    conf = conf;      
  }
  
  void update(){
    
  }
  
  Uri getUri(){
    return Uri.parse(conf.getAPIURI().toString()+path);
  }
  
  List<VivaldiCoordinate> getList(){
    return _coordinateList;
  }
}