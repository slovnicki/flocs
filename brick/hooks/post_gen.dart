import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final packageName = context.vars['name'];

  context.logger.info('Copying Markdown files to assets...');
  // ---------------------------------------------------------------------------
  final fileNames = context.vars['file_names'];
  for (final fileNameMap in fileNames) {
    final fileName = fileNameMap['file_name'];
    context.logger.info('  - copying $fileName.md');
    final file = File('${context.vars['markdown_dir']}/$fileName.md');
    await file.copy('$packageName/assets/markdown/$fileName.md');
  }

  context.logger.info('Creating screens...');
  // --------------------------------------------------------------------------
  final generator = await MasonGenerator.fromBrick(
    Brick.path('../brick/bricks/markdown_page'),
  );
  for (final fileNameMap in fileNames) {
    final fileName = fileNameMap['file_name'];
    context.logger.info('  - generating for $fileName');
    await generator.generate(
      DirectoryGeneratorTarget(Directory('$packageName/lib/presentation')),
      vars: {
        'name': fileName,
        'package': packageName,
      },
    );
  }
}
