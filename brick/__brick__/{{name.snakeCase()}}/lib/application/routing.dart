import 'package:beamer/beamer.dart';
import 'package:{{name.snakeCase()}}presentation/introduction_screen.dart';
{{#file_names}}
import 'package:{{name.snakeCase()}}presentation/{{file_name.snakeCase()}}_screen.dart';
{{/file_names}}

final rootBeamerDelegate = BeamerDelegate(
  transitionDelegate: const NoAnimationTransitionDelegate(),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (_,__,___) => IntroductionScreen.page,
      {{#file_names}}
        '/{{file_name.snakeCase()}}': (_,__,___) =>  {{file_name.pascalCase()}}Screen.page,
      {{/file_names}}
    },
  ),
);
