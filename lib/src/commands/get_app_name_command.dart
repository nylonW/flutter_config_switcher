import 'package:args/command_runner.dart';
import 'package:flutter_config_switcher/src/utils/target_helper.dart';
import 'package:mason_logger/mason_logger.dart';

class GetAppNameCommand extends Command<int> {
  GetAppNameCommand({
    required Logger logger,
  }) : _logger = logger;

  final Logger _logger;

  @override
  String get description =>
      'Command showing app name for a flavor including dart defines';

  @override
  String get name => 'app_name';

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

    return target['APP_TITLE'] as String;
  }

  String getFlavor() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('You must provide a flavor to use', usage);
    }

    return argResults!.rest.first;
  }
}
