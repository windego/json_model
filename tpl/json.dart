const json_conver_tml = '''
import '../index.dart';

class JsonConvert<T> {
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {%s
    }
    
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {%s
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();

    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}
''';
