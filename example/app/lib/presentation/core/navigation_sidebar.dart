import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class NavigationSidebar extends StatefulWidget {
  const NavigationSidebar({Key? key}) : super(key: key);

  @override
  State<NavigationSidebar> createState() => _NavigationSidebarState();
}

class _NavigationSidebarState extends State<NavigationSidebar> {
  late BeamerDelegate _beamer;

  void _setStateListener() => setState(() {});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _beamer = Beamer.of(context);
    _beamer.removeListener(_setStateListener);
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => _beamer.addListener(_setStateListener),
    );
  }

  @override
  Widget build(BuildContext context) {
    final path = _beamer.configuration.location!;
    return SizedBox(
      width: 256,
      child: Column(
        children: [
          NavigationButton(
            text: 'Introduction',
            isSelected: path == '/',
            onTap: () => _beamer.beamToNamed('/'),
          ),
          
            NavigationButton(
              text: 'Second Topic',
              isSelected: path == '/second_topic',
              onTap: () => _beamer.beamToNamed('/second_topic'),
            ),
          
            NavigationButton(
              text: 'First Topic',
              isSelected: path == '/first_topic',
              onTap: () => _beamer.beamToNamed('/first_topic'),
            ),
          
        ],
      ),
    );
  }

  @override
  void dispose() {
    _beamer.removeListener(_setStateListener);
    super.dispose();
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      child: InkWell(
        onTap: onTap,
        hoverColor: theme.hoverColor,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.button!.copyWith(
                  color: isSelected ? Colors.blue : null,
                ),
          ),
        ),
      ),
    );
  }
}
