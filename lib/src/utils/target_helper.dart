import 'dart:convert';
import 'dart:io';

import 'package:flutter_config_switcher/src/models/target/target.dart';
import 'package:path/path.dart' as path;
import 'package:collection/collection.dart';

class TargetHelper {
  static Target? getTarget({required String flavor}) {
    final targets = getAllTargets()!;
    final target = targets.firstWhereOrNull(
      (element) => element.flavor.toLowerCase() == flavor.toLowerCase(),
    );

    return target;
  }

  static List<Target>? getAllTargets() {
    final targetFile =
        File(path.absolute(path.join('app_targets', 'targets.json')));
    if (!targetFile.existsSync()) {
      return null;
    }

    final targetsFileContent = targetFile.readAsStringSync();
    final targetsFileJsonArray =
        jsonDecode(targetsFileContent) as List<dynamic>;
    final targets = targetsFileJsonArray
        .map((e) => Target.fromJson(e as Map<String, dynamic>))
        .toList();

    return targets;
  }
}
