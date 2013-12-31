library vivaldiInitTimeList;

import 'package:MonitoringVivaldiClient/model/distantelement.dart';
import 'package:MonitoringVivaldiClient/model/elems/vivaldi_initime.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';

class VivaldiInitTimeList implements distantElement {
  
  static String path = "/initTimes/";
  
  static Configuration conf;
  
  List<VivaldiInitTime> _initTimeList;
  
  VivaldiInitTimeList(Configuration conf){
    conf = conf;      
  }
  
  void update(){
    
  }
  
  String getPath(){
    return ""+conf.getAPIURI()+path;
  }
  
  List<VivaldiInitTime> getList(){
    return _initTimeList;
  }
}