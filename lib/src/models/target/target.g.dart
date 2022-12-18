// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Target _$$_TargetFromJson(Map<String, dynamic> json) => _$_Target(
      title: json['title'] as String,
      bundleName: json['bundleName'] as String,
      flavor: json['flavor'] as String,
      icon: json['icon'] as String,
      args: (json['args'] as List<dynamic>).map((e) => e as String).toList(),
      firebaseConfig: json['firebaseConfig'] == null
          ? null
          : FirebaseConfig.fromJson(
              json['firebaseConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TargetToJson(_$_Target instance) => <String, dynamic>{
      'title': instance.title,
      'bundleName': instance.bundleName,
      'flavor': instance.flavor,
      'icon': instance.icon,
      'args': instance.args,
      'firebaseConfig': instance.firebaseConfig,
    };
