library configurationLib;
import 'dart:html';
import 'package:bootjack/bootjack.dart';
import 'package:yaml/yaml.dart';
import 'package:MonitoringVivaldiClient/io/dndfiles.dart';

class Configuration {
  
  Map<String,Plot> plots;
  
  Element _configureButton;
  Modal _configurationModal;

  String _apiLogin;
  String _apiPassword;
  String _apiURI;
  
  DndFiles _configFile;
  FileReader _reader;
  
  Configuration(DndFiles configFilec){
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
      
      _apiLogin = doc['rootUrl'];
      _apiPassword = doc['login'];
      _apiURI = doc['password'];
      
      print("Login : "+_apiLogin);
      print("Pass : "+_apiPassword);
      print("Login : "+_apiURI);
      
      _configurationModal.toggle();
    });
  }
  
  String getAPILogin(){
    return _apiLogin;
  }
  String getAPIPassword(){
    return _apiPassword;
  }
  String getAPIURI(){
    return _apiURI;
  }
  
  Map<String,Plot> getPlots(){
    return plots;
  }
  
  void addPlot(String name, Plot plot){
    plots.putIfAbsent(name, plot);
  }
}
