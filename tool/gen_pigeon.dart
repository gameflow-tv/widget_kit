// ignore_for_file: avoid_print

import 'dart:io';

Future<void> runPigeon(String input, String dartOut, String swiftOut) async {
  var result = await Process.run('dart', [
    'run',
    'pigeon',
    '--input',
    input,
    '--dart_out',
    dartOut,
    '--swift_out',
    swiftOut
  ]);

  if (result.exitCode != 0) {
    print('Error running pigeon:\n${result.stderr}');
    exit(result.exitCode);
  }
}

void main() async {
  // UserDefaults for iOS
  await runPigeon(
    'api/user_defaults.dart',
    'lib/api/user_defaults.dart',
    'ios/Classes/UserDefaultsAPI.swift',
  );

  // UserDefaults for macOS
  await runPigeon(
    'api/user_defaults.dart',
    'lib/api/user_defaults.dart',
    'macos/Classes/UserDefaultsAPI.swift',
  );

  // WidgetKit for iOS
  await runPigeon(
    'api/widget_kit.dart',
    'lib/api/widget_kit.dart',
    'ios/Classes/WidgetKitAPI.swift',
  );

  // WidgetKit for macOS
  await runPigeon(
    'api/widget_kit.dart',
    'lib/api/widget_kit.dart',
    'macos/Classes/WidgetKitAPI.swift',
  );
}
