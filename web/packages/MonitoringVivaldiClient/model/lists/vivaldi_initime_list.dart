library vivaldiInitTimeList;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_initime.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';
import 'package:MonitoringVivaldiClient/model/model.dart';

class VivaldiInitTimeList implements distantElement {
  
  static String path = "/initTimes/";
  
  List<VivaldiInitTime> _initTimeList;
  
  VivaldiInitTimeList(){     
  }
  
  void update(){
    
  }
  
  Uri getUri(){
    return Uri.parse(Model.config.getAPIURI().toString()+path);
  }
  
  List<VivaldiInitTime> getList(){
    return _initTimeList;
  }
}