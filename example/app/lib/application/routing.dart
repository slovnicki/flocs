import 'package:beamer/beamer.dart';
import 'package:app/presentation/introduction_screen.dart';

import 'package:app/presentation/second_topic_screen.dart';

import 'package:app/presentation/first_topic_screen.dart';


final rootBeamerDelegate = BeamerDelegate(
  transitionDelegate: const NoAnimationTransitionDelegate(),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (_,__,___) => IntroductionScreen.page,
      
        '/second-topic': (_,__,___) =>  SecondTopicScreen.page,
      
        '/first-topic': (_,__,___) =>  FirstTopicScreen.page,
      
    },
  ),
);
