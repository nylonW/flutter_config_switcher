import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_config.freezed.dart';
part 'firebase_config.g.dart';

@freezed
class FirebaseConfig with _$FirebaseConfig {
  factory FirebaseConfig({
    required String email,
    required String? token,
    required String project,
  }) = _FirebaseConfig;

  factory FirebaseConfig.fromJson(Map<String, dynamic> json) =>
      _$FirebaseConfigFromJson(json);
}
