import 'package:bootjack/bootjack.dart';
import 'package:logging/logging.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration_factory.dart';

void main() {
  configuration();
}

void configuration(){
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  
  Modal.use();
  Transition.use();
  
  var config = ConfigurationFactory.getLoggingConfiguration();
  
}