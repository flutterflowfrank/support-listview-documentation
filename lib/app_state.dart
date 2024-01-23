import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _asmsg = prefs.getString('ff_asmsg') ?? _asmsg;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _asmsg = 'hello word';
  String get asmsg => _asmsg;
  set asmsg(String _value) {
    _asmsg = _value;
    prefs.setString('ff_asmsg', _value);
  }

  List<String> _appStateList = [];
  List<String> get appStateList => _appStateList;
  set appStateList(List<String> _value) {
    _appStateList = _value;
  }

  void addToAppStateList(String _value) {
    _appStateList.add(_value);
  }

  void removeFromAppStateList(String _value) {
    _appStateList.remove(_value);
  }

  void removeAtIndexFromAppStateList(int _index) {
    _appStateList.removeAt(_index);
  }

  void updateAppStateListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _appStateList[_index] = updateFn(_appStateList[_index]);
  }

  void insertAtIndexInAppStateList(int _index, String _value) {
    _appStateList.insert(_index, _value);
  }

  MsgStruct _structMsg = MsgStruct.fromSerializableMap(
      jsonDecode('{\"id\":\"1\",\"body\":\"msg body\"}'));
  MsgStruct get structMsg => _structMsg;
  set structMsg(MsgStruct _value) {
    _structMsg = _value;
  }

  void updateStructMsgStruct(Function(MsgStruct) updateFn) {
    updateFn(_structMsg);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
