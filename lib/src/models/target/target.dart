import 'package:flutter_config_switcher/src/models/target/firebase_config/firebase_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'target.freezed.dart';
part 'target.g.dart';

@freezed
class Target with _$Target {
  const factory Target({
    required String title,
    required String bundleName,
    required String flavor,
    required String icon,
    required List<String> args,
    required FirebaseConfig? firebaseConfig,
  }) = _Target;

  factory Target.example() => const Target(
        title: 'Example',
        bundleName: 'com.example.fcsexample',
        flavor: 'example',
        icon: 'example.jpg',
        args: [
          'FB_ID=123456789',
          'FB_CLIENT_TOKEN=123456789',
          'APP_ID=id123abc'
        ],
        firebaseConfig: null,
      );

  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);
}
