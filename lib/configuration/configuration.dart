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

  String _apiLogin;
  String _apiPassword;
  Uri _apiURI;
  
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
      _apiLogin = doc['login'];
      _apiPassword = doc['password'];
      
      print("Login : "+_apiLogin);
      print("Pass : "+_apiPassword);
      print("Uri : "+_apiURI.toString());
      
      _configurationModal.toggle();
      
      configDoneController.add("configured");
    });
  }
  
  Stream get configDone => configDoneController.stream;
  
  String getAPILogin(){
    return _apiLogin;
  }
  String getAPIPassword(){
    return _apiPassword;
  }
  Uri getAPIURI(){
    return _apiURI;
  }
}
