import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:collection/collection.dart';

class TargetHelper {
  static Map<String, dynamic>? getTarget({required String flavor}) {
    final targets = getAllTargets()!;
    final target = targets.firstWhereOrNull(
      (element) =>
          (element['APP_FLAVOR'] as String).toLowerCase() ==
          flavor.toLowerCase(),
    );

    return target;
  }

  static List<Map<String, dynamic>>? getAllTargets() {
    final targetFile =
        File(path.absolute(path.join('app_targets', 'targets.json')));
    if (!targetFile.existsSync()) {
      return null;
    }

    final targetsFileContent = targetFile.readAsStringSync();
    final targetsFileJsonArray = jsonDecode(targetsFileContent) as List;
    final targets = targetsFileJsonArray
        .map((e) => e as Map<String, dynamic>)
        .toList(growable: false);
    return targets;
  }
}
