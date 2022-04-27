import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  static BeamPage page = const BeamPage(
    key: ValueKey('introduction'),
    title: '{{#titleCase}}{{name}}{{/titleCase}}',
    child: IntroductionScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'Welcome to {{#titleCase}}{{name}}{{/titleCase}}!',
        style: Theme.of(context).textTheme.headline3,
        textAlign: TextAlign.center,
      ),
    );
  }
}
