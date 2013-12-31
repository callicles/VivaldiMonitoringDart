library dndFiles;

import 'dart:html';
import 'package:MonitoringVivaldiClient/io/htmlescape.dart';

class DndFiles {
  FormElement _readForm;
  InputElement _fileInput;
  OutputElement _output;
  
  bool _fileValidity = false;

  DndFiles() {
    _output = document.querySelector('#list');
    _readForm = document.querySelector('#read');
    _fileInput = document.querySelector('#files');
    _fileInput.onChange.listen((e) => _onFileInputChange());
  }

  void _onFileInputChange() {
    _onFilesSelected(_fileInput.files);
  }

  void _onFilesSelected(List<File> files) {
    _output.nodes.clear();
    var list = new Element.tag('ul');
    for (var file in files) {
      var item = new Element.tag('li');

      if (file.name.indexOf('.yaml') != -1 ){
        Element warning = querySelector('.alert');
        if (warning != null){
          warning.remove();
        }
        
        _fileValidity = true;
        querySelector("#configureButtton").attributes.remove('disabled');
        
        var properties = new Element.tag('span');
        properties.innerHtml = (new StringBuffer('<strong>')
        ..write(htmlEscape(file.name))
          ..write('</strong> (')
          ..write(file.type != null ? htmlEscape(file.type) : 'n/a')
          ..write(') ')
          ..write(file.size)
          ..write(' bytes')
          // TODO(jason9t): Re-enable this when issue 5070 is resolved.
          // http://code.google.com/p/dart/issues/detail?id=5070
          // ..add(', last modified: ')
          // ..add(file.lastModifiedDate != null ?
          //       file.lastModifiedDate.toLocal().toString() :
          //       'n/a')
        ).toString();
        item.nodes.add(properties);
        list.nodes.add(item);
      } else {
        Element modalBody = querySelector('.modal-body');
        modalBody.appendHtml('<div class="alert alert-warning">You should select a YAML file as a configuration file.</div>');
      }


    }
    _output.nodes.add(list);
  }
  
  File getFile(){
    if (_fileValidity){
      return _fileInput.files[0];
    }else {
      return null;
    }
  }
}