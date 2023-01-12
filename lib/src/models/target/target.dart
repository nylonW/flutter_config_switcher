import 'package:freezed_annotation/freezed_annotation.dart';

part 'target.freezed.dart';
part 'target.g.dart';

@freezed
class Target with _$Target {
  const factory Target({
    required String title,
    required String bundleName,
    required String flavor,
    required List<String> args,
  }) = _Target;

  factory Target.example() => const Target(
        title: 'Example',
        bundleName: 'com.example.fcsexample',
        flavor: 'example',
        args: [
          'FB_ID=123456789',
          'FB_CLIENT_TOKEN=123456789',
          'APP_ID=id123abc'
        ],
      );

  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);
}
