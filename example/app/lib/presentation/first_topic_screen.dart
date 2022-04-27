import 'package:flutter/widgets.dart';
import 'package:beamer/beamer.dart';
import 'package:app/presentation/core/markdown_screen.dart';

class FirstTopicScreen extends MarkdownScreen {
  const FirstTopicScreen({Key? key})
      : super(key: key, mdAsset: 'assets/markdown/first_topic.md');

   static BeamPage page = const BeamPage(
    key: ValueKey('first_topic'),
    title: 'First Topic',
    child: FirstTopicScreen(),
  );
}
