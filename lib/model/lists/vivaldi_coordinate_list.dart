library vivaldiCoordinateList;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_coordinate.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';
import 'package:MonitoringVivaldiClient/model/model.dart';

class VivaldiCoordinateList implements distantElement {
  
  static String path = "/coordinates/";
  
  List<VivaldiCoordinate> _coordinateList;
  
  VivaldiCoordinateList(){     
  }
  
  void update(){
    
  }
  
  Uri getUri(){
    return Uri.parse(Model.config.getAPIURI().toString()+path);
  }
  
  List<VivaldiCoordinate> getList(){
    return _coordinateList;
  }
}