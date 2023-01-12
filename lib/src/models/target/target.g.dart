// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Target _$$_TargetFromJson(Map<String, dynamic> json) => _$_Target(
      title: json['title'] as String,
      bundleName: json['bundleName'] as String,
      flavor: json['flavor'] as String,
      args: (json['args'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_TargetToJson(_$_Target instance) => <String, dynamic>{
      'title': instance.title,
      'bundleName': instance.bundleName,
      'flavor': instance.flavor,
      'args': instance.args,
    };
