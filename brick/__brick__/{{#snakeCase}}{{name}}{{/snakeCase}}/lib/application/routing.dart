import 'package:beamer/beamer.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/presentation/introduction_screen.dart';
{{#file_names}}
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/presentation/{{#snakeCase}}{{file_name}}{{/snakeCase}}_screen.dart';
{{/file_names}}

final rootBeamerDelegate = BeamerDelegate(
  transitionDelegate: const NoAnimationTransitionDelegate(),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (_,__,___) => IntroductionScreen.page,
      {{#file_names}}
        '/{{#snakeCase}}{{file_name}}{{/snakeCase}}': (_,__,___) =>  {{#pascalCase}}{{file_name}}{{/pascalCase}}Screen.page,
      {{/file_names}}
    },
  ),
);
