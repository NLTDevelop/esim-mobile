
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/bloc/preview_tariffs_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/preview_tariffs_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PreviewTariffsPage extends StatelessWidget {
  const PreviewTariffsPage({super.key, required this.iconPath, required this.country, this.isFromWelcome = false});

  final String country;
  final String iconPath;
  final bool isFromWelcome;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final bloc = PreviewTariffsBloc(iconPath: iconPath, country: country, isFromWelcome: isFromWelcome);
        bloc.add(const PreviewTariffsEvent.fetchTariffs());
        return bloc;
      },
      child: DefaultScaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: const Icon(Icons.arrow_back_ios_sharp, size: 24,),
          ),
          centerTitle: true,
          title: DefaultText.bodySmall(country,),
        ),
        body: const PreviewTariffsBody(),
      ),
    );
  }
}
