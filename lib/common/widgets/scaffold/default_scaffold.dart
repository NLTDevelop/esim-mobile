import 'package:esim_mob_app/common/widgets/scaffold/logger_scaffold.dart';
import 'package:flutter/material.dart';


class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.extendBodyBehindAppBar,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final bool? extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context) => LoggerScaffold(
    resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    appBar: appBar,
    body: body,
    backgroundColor: backgroundColor,
    bottomNavigationBar: bottomNavigationBar,
    floatingActionButton: floatingActionButton,
    extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
  );
}
