import 'package:args/command_runner.dart';
import 'package:flutter_config_switcher/src/models/target/target.dart';
import 'package:flutter_config_switcher/src/utils/target_helper.dart';
import 'package:mason_logger/mason_logger.dart';

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
    _logger.info('Running build command');
    final currentFlavor = getFlavor();

    _logger.info('Current flavor: $currentFlavor \n');

    final target = TargetHelper.getTarget(flavor: currentFlavor);
    if (target == null) {
      return ExitCode.usage.code;
    }

    _logger.success(buildCommand(target));

    return ExitCode.success.code;
  }

  String buildCommand(Target target) {
    final buildTypes = <String>['appbundle', 'apk', 'ipa'];

    return buildTypes
        .map(
          (e) => '''
fvm flutter build $e --release -t lib/main/main.dart \\
--obfuscate --split-debug-info=maps/debug_${target.flavor} \\
--dart-define=APP_TITLE="${target.title}" \\
--dart-define=APP_FLAVOR="${target.flavor}" \\
${target.args.map((e) => '--dart-define=$e').join(' \\ \n')}''',
)
        .join('\n\n');
  }

  String getFlavor() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('You must provide a flavor to use', usage);
    }

    return argResults!.rest.first;
  }
}
