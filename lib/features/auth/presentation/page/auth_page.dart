import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/login/login_widget.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      backgroundColor: Theme.of(context).extension<ColorExtension>()!
          .splashBackground,
      body: SafeArea(
          child:
      LoginWidget()
      ),
    );
  }
}
