library model;

import 'package:MonitoringVivaldiClient/model/lists/vivaldi_node_list.dart';
import 'package:MonitoringVivaldiClient/model/lists/vivaldi_initime_list.dart';
import 'package:MonitoringVivaldiClient/model/lists/vivaldi_network_list.dart';
import 'package:MonitoringVivaldiClient/model/lists/vivaldi_coordinate_list.dart';

import 'package:MonitoringVivaldiClient/configuration/configuration.dart';
import 'package:MonitoringVivaldiClient/io/configFile.dart';

import 'package:MonitoringVivaldiClient/plots/plot.dart';

class Model {
  
  static Configuration config;
  
  static VivaldiNetworkList vivaldiNetworks = new VivaldiNetworkList();
  static VivaldiNodeList vivaldiNodes = new VivaldiNodeList();
  static VivaldiInitTimeList vivaldiInitTime = new VivaldiInitTimeList();
  static VivaldiCoordinateList vivaldiCoordinates = new VivaldiCoordinateList();
  
  Map<String,VivaldiPlot> plots;
  
  Model(){
    config = new Configuration(new ConfigFile());
    config.configDone.listen((_) => init());
  }
  
  
  Map<String,VivaldiPlot> getPlots(){
    return plots;
  }
  
  void addPlot(String name, VivaldiPlot plot){
    plots.putIfAbsent(name, () => plot);
  }
  
  void init(){
    vivaldiNetworks.update();
  }
  
}