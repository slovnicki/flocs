import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class NavigationSidebar extends StatefulWidget {
  const NavigationSidebar({Key? key, this.closeDrawer}) : super(key: key);

  final void Function()? closeDrawer;

  @override
  State<NavigationSidebar> createState() => _NavigationSidebarState();
}

class _NavigationSidebarState extends State<NavigationSidebar> {
  late bool _isDrawer;
  late BeamerDelegate _beamer;

  void _setStateListener() => setState(() {});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isDrawer = widget.closeDrawer != null;
    _beamer = Beamer.of(context);
    _beamer.removeListener(_setStateListener);
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => _beamer.addListener(_setStateListener),
    );
  }

  @override
  Widget build(BuildContext context) {
    final path = _beamer.configuration.location!;
    return Padding(
      padding: EdgeInsets.only(top: _isDrawer ? kToolbarHeight : 0.0),
      child: SizedBox(
        width: 256,
        child: MaybeDrawer(
          isDrawer: _isDrawer,
          child: Column(
            children: [
              NavigationButton(
                text: 'Introduction',
                isSelected: path == '/',
                onTap: () {
                  _beamer.beamToNamed('/');
                  widget.closeDrawer?.call();
                },
              ),
              {{#file_names}}
                NavigationButton(
                  text: '{{#titleCase}}{{file_name}}{{/titleCase}}',
                  isSelected: path == '/{{#snakeCase}}{{file_name}}{{/snakeCase}}',
                  onTap: () {
                     _beamer.beamToNamed('/{{#snakeCase}}{{file_name}}{{/snakeCase}}');
                     widget.closeDrawer?.call();
                  },
                ),
              {{/file_names}}
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _beamer.removeListener(_setStateListener);
    super.dispose();
  }
}

class MaybeDrawer extends StatelessWidget {
  const MaybeDrawer({
    Key? key,
    this.isDrawer = false,
    required this.child,
  }) : super(key: key);

  final bool isDrawer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isDrawer ? Drawer(child: child) : child;
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
