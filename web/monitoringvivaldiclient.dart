import 'package:bootjack/bootjack.dart';
import 'package:logging/logging.dart';
import 'package:MonitoringVivaldiClient/io/dndfiles.dart';
import 'package:MonitoringVivaldiClient/configuration/configuration.dart';
import 'package:MonitoringVivaldiClient/model/lists/vivaldi_node_list.dart';

void main() {
  configuration();
}

void configuration(){
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  
  Modal.use();
  Transition.use();
  
  Configuration config = new Configuration(new DndFiles());
  
  config.configDone.listen((_) => test(config));

}

void test(Configuration config){
  print("configuration done");
  var nodeList = new VivaldiNodeList(config);
  
  nodeList.update();
  
  print(nodeList.getList());
  
}