library ConfigurationFactory;

import 'configuration.dart';
import 'package:MonitoringVivaldiClient/io/dndfiles.dart';

class ConfigurationFactory {
  
  static DndFiles _configFile = new DndFiles();
  
  static Configuration _instance = new Configuration(_configFile);

  static Configuration getLoggingConfiguration() {
    return _instance;
  }

}