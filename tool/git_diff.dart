// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/args.dart';

void main(List<String> args) async {
  // Parse args
  final parser = ArgParser();

  parser.addOption(
    'dir',
    abbr: 'd',
    help: 'Directory to search for files with git diffs',
  );

  parser.addOption(
    'file',
    abbr: 'f',
    help: 'File to check for git diff',
  );

  final results = parser.parse(args);

  final dir = results['dir'] as String?;
  final file = results['file'] as String?;

  if (dir == null && file == null) {
    print('Please provide a directory or file to check for git diff');
    exit(1);
  }

  if (dir != null && file != null) {
    print('Please provide only a directory or file to check for git diff');
    exit(1);
  }

  if (dir != null) {
    var result = await Process.run(
      'git',
      ['diff', '--name-only', '--relative', dir],
    );

    if (result.stdout.toString().isEmpty) {
      print('No diff found in $dir');
    } else {
      print('Diff found in $dir');
      print(result.stdout);
      exit(1);
    }
  }

  if (file != null) {
    var result = await Process.run(
      'git',
      ['diff', '--name-only', file],
    );

    if (result.stdout.toString().isEmpty) {
      print('No diff found in $file');
    } else {
      print('Diff found in $file');
      print(result.stdout);
      exit(1);
    }
  }
}
