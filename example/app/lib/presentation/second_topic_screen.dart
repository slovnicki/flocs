import 'package:flutter/widgets.dart';
import 'package:beamer/beamer.dart';
import 'package:app/presentation/core/markdown_screen.dart';

class SecondTopicScreen extends MarkdownScreen {
  const SecondTopicScreen({Key? key})
      : super(key: key, mdAsset: 'assets/markdown/second_topic.md');

   static BeamPage page = const BeamPage(
    key: ValueKey('second_topic'),
    title: 'Second Topic',
    child: SecondTopicScreen(),
  );
}
