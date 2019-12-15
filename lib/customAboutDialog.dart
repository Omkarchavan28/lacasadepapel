import 'package:flutter/material.dart';

void customShowAboutDialog({
  @required BuildContext context,
  String applicationName,
  String applicationVersion,
  Widget applicationIcon,
  String applicationLegalese,
  List<Widget> children,
  bool useRootNavigator = true,
}) {
  assert(context != null);
  assert(useRootNavigator != null);
  showDialog<void>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (BuildContext context) {
      return CustomAboutDialog(
        applicationName: applicationName,
        applicationVersion: applicationVersion,
        applicationIcon: applicationIcon,
        applicationLegalese: applicationLegalese,
        children: children,
      );
    },
  );
}

class CustomAboutDialog extends StatelessWidget {
  const CustomAboutDialog({
    Key key,
    this.applicationName,
    this.applicationVersion,
    this.applicationIcon,
    this.applicationLegalese,
    this.children,
  }) : super(key: key);

  final String applicationName;

  final String applicationVersion;

  final Widget applicationIcon;

  final String applicationLegalese;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final String name = applicationName;
    final String version = applicationVersion;
    final Widget icon = applicationIcon;
    return AlertDialog(
      backgroundColor: Colors.black,
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (icon != null)
                  IconTheme(
                      data: Theme.of(context)
                          .iconTheme
                          .copyWith(color: Colors.white),
                      child: icon),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListBody(
                      children: <Widget>[
                        Text(
                          name,
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          version,
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(color: Colors.white),
                        ),
                        Container(height: 18.0),
                        Text(
                          applicationLegalese ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ...?children,
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(MaterialLocalizations.of(context).closeButtonLabel),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
