library configurationLib;

import 'dart:async';
import 'dart:html';
import 'package:bootjack/bootjack.dart';
import 'package:yaml/yaml.dart';
import 'package:MonitoringVivaldiClient/io/configFile.dart';

class Configuration {
  
  StreamController configDoneController = new StreamController.broadcast();
  
  Element _configureButton;
  Modal _configurationModal;

  Uri _apiURI; 
  Map<String,String> _requestAuthHeader = new Map<String,String>();
  
  ConfigFile _configFile;
  FileReader _reader;
  
  Configuration(ConfigFile configFilec){
    _configurationModal = Modal.wire(querySelector('#configuration-mod'));
    
    _configFile = configFilec;
    _configureButton = document.querySelector("#configureButtton");
    _configureButton.onClick.listen((e) => loadConfigurationFromYAML());
    
    _reader = new FileReader();
    
    _configurationModal.toggle();
  }
  
  void loadConfigurationFromYAML(){
    
    _reader.readAsText(_configFile.getFile());
    _reader.onLoad.listen((e) {
      
      var doc = loadYaml(_reader.result);

      _apiURI = Uri.parse(doc['rootUrl']);
      _requestAuthHeader.putIfAbsent("authorization", ()=>"Basic "+window.btoa(doc['login']+":"+ doc['password']));
      _requestAuthHeader.putIfAbsent("accept", ()=>"application/json");
      
      _configurationModal.toggle();
      
      configDoneController.add("configured");
    });
  }
  
  Stream get configDone => configDoneController.stream;
  
  Map<String,String> getAuthHeader(){
    return _requestAuthHeader;
  }

  Uri getAPIURI(){
    return _apiURI;
  }
}
