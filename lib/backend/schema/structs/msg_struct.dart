// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MsgStruct extends BaseStruct {
  MsgStruct({
    int? id,
    String? body,
  })  : _id = id,
        _body = body;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  set body(String? val) => _body = val;
  bool hasBody() => _body != null;

  static MsgStruct fromMap(Map<String, dynamic> data) => MsgStruct(
        id: castToType<int>(data['id']),
        body: data['body'] as String?,
      );

  static MsgStruct? maybeFromMap(dynamic data) =>
      data is Map ? MsgStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'body': _body,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'body': serializeParam(
          _body,
          ParamType.String,
        ),
      }.withoutNulls;

  static MsgStruct fromSerializableMap(Map<String, dynamic> data) => MsgStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        body: deserializeParam(
          data['body'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MsgStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MsgStruct && id == other.id && body == other.body;
  }

  @override
  int get hashCode => const ListEquality().hash([id, body]);
}

MsgStruct createMsgStruct({
  int? id,
  String? body,
}) =>
    MsgStruct(
      id: id,
      body: body,
    );
