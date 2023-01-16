import 'package:args/command_runner.dart';
import 'package:flutter_config_switcher/src/utils/target_helper.dart';
import 'package:mason_logger/mason_logger.dart';

enum BuildType {
  apk,
  ipa,
  appbundle,
  ios,
}

class BuildCommand extends Command<int> {
  BuildCommand({
    required Logger logger,
  }) : _logger = logger;

  final Logger _logger;

  @override
  String get description =>
      'Command showing build command for a flavor including dart defines';

  @override
  String get name => 'build';

  @override
  Future<int> run() async {
    final currentFlavor = getFlavor();

    final target = TargetHelper.getTarget(flavor: currentFlavor);
    if (target == null) {
      return ExitCode.usage.code;
    }

    _logger.success(buildCommand(target));

    return ExitCode.success.code;
  }

  String buildCommand(Map<String, dynamic> target) {
    final buildType = getBuildType().name;
    final dimension = target['DIMENSION'] ?? 'production';

    return 'fvm flutter build $buildType --release --flavor=$dimension -t lib/main/main.dart --obfuscate --split-debug-info=maps/debug_${target['APP_FLAVOR']} ${target.entries.map(
          (entry) =>
              '--dart-define="${entry.key}=${entry.value}"',
        ).toList().join(' ')}';
  }

  String getFlavor() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('You must provide a flavor to use', usage);
    }

    return argResults!.rest.first;
  }

  BuildType getBuildType() {
    if (argResults!.rest.length < 2) {
      return BuildType.apk;
    }

    return BuildType.values.firstWhere(
      (buildType) => buildType.name == argResults!.rest[1],
      orElse: () => throw UsageException(
        'Invalid build type, eg. apk, ios, appbundle',
        usage,
      ),
    );
  }
}
