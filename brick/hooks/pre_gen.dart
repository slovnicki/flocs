import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  context.logger.info('Reading and Markdown file names...');
  // ---------------------------------------------------------------------------
  final dir = Directory(context.vars['markdown_dir']);
  final files = await dir.list().toList();
  final fileNames = files.map(
    (file) {
      var fileName = file.path.split('/').last;
      context.logger.info('  - found $fileName');
      fileName = fileName.split('.').first;
      return fileName;
    },
  );
  context.vars = {
    ...context.vars,
    'file_names': fileNames.map((fileName) => {'file_name': fileName}).toList(),
  };
  context.logger.info('Read and stored Markdown file names!');
}
