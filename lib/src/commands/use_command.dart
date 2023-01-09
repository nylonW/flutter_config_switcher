import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:flutter_config_switcher/src/models/target/target.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as path;
import 'package:collection/collection.dart';

/// {@template use_command}
///
/// `flutter_config_switcher use`
/// A [Command] to exemplify a sub command
/// {@endtemplate}
class UseCommand extends Command<int> {
  /// {@macro use_command}
  UseCommand({
    required Logger logger,
  }) : _logger = logger;

  @override
  String get description =>
      'Command to switch between targets for your project.';

  @override
  String get name => 'use';

  final Logger _logger;

  @override
  Future<int> run() async {
    final currentFlavor = getFlavor();
    _logger.info('Using flavor: $currentFlavor');

    final targetFile =
        File(path.absolute(path.join('app_targets', 'targets.json')));
    if (!targetFile.existsSync()) {
      _logger.err('targets.json file not found');
      return ExitCode.usage.code;
    }
    final targetsFileContent = targetFile.readAsStringSync();
    final targetsFileJsonArray =
        jsonDecode(targetsFileContent) as List<dynamic>;
    final targets = targetsFileJsonArray
        .map((e) => Target.fromJson(e as Map<String, dynamic>))
        .toList();

    final target = targets.firstWhereOrNull(
      (element) => element.flavor.toLowerCase() == currentFlavor.toLowerCase(),
    );

    if (target == null) {
      throw UsageException(
        'Flavor $currentFlavor not found in targets.json',
        usage,
      );
    }

    final iconsCreated = await generateIcons(target);
    final firebaseConfigured = await configureFirebase(target);
    _logger
      ..info('Icons created: $iconsCreated')
      ..info('Firebase configured: $firebaseConfigured');

    return ExitCode.success.code;
  }

  Future<bool> configureFirebase(Target target) async {
    final flutterFireConfigurationProcess = await Process.start(
      'flutterfire',
      [
        'configure',
        '--project=${target.firebaseConfig!.project}',
        '--platforms=android,ios',
        '--account=${target.firebaseConfig!.email}',
        //'--token=${target.firebaseConfig!.token}',
        '--ios-bundle-id=${target.bundleName}',
        '--yes',
        '--android-package-name=${target.bundleName}',
      ],
    );

    flutterFireConfigurationProcess.stdout
        .transform(utf8.decoder)
        .listen(_logger.info);
    flutterFireConfigurationProcess.stderr
        .transform(utf8.decoder)
        .listen(_logger.err);

    return await flutterFireConfigurationProcess.exitCode == 0;
  }

  Future<bool> generateIcons(Target target) async {
    final iconFile = File(
      path.join(
        'app_targets',
        'icons',
        target.icon,
      ),
    );
    if (!iconFile.existsSync()) {
      _logger.err('Icon file not found');
      return false;
    }
    File(
      path.join(
        'app_targets',
        'current.jpg',
      ),
    ).writeAsBytesSync(iconFile.readAsBytesSync());

    final flutterLauncherIconsProcess = await Process.start(
      'flutter',
      [
        'pub',
        'run',
        'flutter_launcher_icons',
        '-f',
        'app_targets/flutter_launcher_icons.yaml'
      ],
      runInShell: true,
    );

    flutterLauncherIconsProcess.stderr
        .transform(utf8.decoder)
        .listen(_logger.err);

    return await flutterLauncherIconsProcess.exitCode == 0;
  }

  String getFlavor() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('You must provide a flavor to use', usage);
    }

    return argResults!.rest.first;
  }
}
