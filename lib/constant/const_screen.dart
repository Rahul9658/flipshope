
import 'package:flutter/foundation.dart';
printDebug(object, {String? title}) {
  if (kDebugMode) {
    debugPrint(" ---------------------\x1B[35m ${title ?? 'Debug Print Start'} \x1B[0m ------------------------------\x1B[0m\n"
        "${'\x1B[32m $object\x1B[0m'}"
        "\n \x1B[36m ----------------------------------------------------------------------\x1B[0m");
  }
}
