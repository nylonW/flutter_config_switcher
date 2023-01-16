import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:collection/collection.dart';
import 'package:flutter_config_switcher/src/templates/flutter_icons_template.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as path;

/// {@template init_command}
///
/// `flutter_config_switcher init`
/// A [Command] to exemplify a sub command
/// {@endtemplate}
class SampleCommand extends Command<int> {
  /// {@macro init_command}
  SampleCommand({
    required Logger logger,
  }) : _logger = logger;

  @override
  String get description =>
      'Command to init flutter_config_switcher for your project.';

  @override
  String get name => 'init';

  final Logger _logger;

  @override
  Future<int> run() async {
    final currentPath = getCurrentPath();

    final created = createTargetsFile(currentPath);
    _logger.info('Created targets.json file: $created');
    return ExitCode.success.code;
  }

  String getCurrentPath() {
    return path.normalize(path.absolute(argResults?.rest.firstOrNull ?? '.'));
  }

  bool createTargetsFile(String currentPath) {
    const encoder = JsonEncoder.withIndent('  ');
    final targetsFile =
        File(path.join(currentPath, 'app_targets', 'targets.json'));
    final iconsFolder =
        Directory(path.join(currentPath, 'app_targets', 'icons'));
    final firebaseFolder =
        Directory(path.join(currentPath, 'app_targets', 'firebase'));
    if (!targetsFile.existsSync()) {
      _logger.info('Creating targets.json file');
      // Create the file

      iconsFolder.createSync(recursive: true);
      firebaseFolder.createSync(recursive: true);
      final flutterIconsFile = File(
        path.join(currentPath, 'app_targets', 'flutter_launcher_icons.yaml'),
      )
        ..createSync(recursive: true)
        ..writeAsStringSync(flutterIconsTemplate);
      targetsFile
        ..createSync(recursive: true)
        ..writeAsStringSync(encoder.convert([]));
      return true;
    }
    return false;
  }
}
