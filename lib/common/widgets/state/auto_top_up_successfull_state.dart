
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AutoTopUpSuccessfulState extends StatelessWidget {
  const AutoTopUpSuccessfulState({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color:
                    Theme.of(context).extension<ColorExtension>()!.toggleCircle,
                    shape: BoxShape.circle),
                child: Icon(Icons.check,
                  color: Theme.of(context)
                      .extension<ColorExtension>()!
                      .toggleActive, size: 40,),
              ),
              const SizedBox(
                width: 30,
              ),
              const DefaultText.bodySmall(
                'Автоповнення успішне',
              ),
              const SizedBox(
                height: 14,
              ),
              PrimaryButton(onTap: () async{
                final authBloc = context.read<AuthentificationBloc>();
                List<UserESimModel> userTariffs = authBloc.state.user.userESims;
                context.read<AuthentificationBloc>().add(const AuthentificationEvent.getSignedInUser());
                ///context.read<HomeBloc>().add(HomeEvent.addESim(tariff: tariffModel));
                context.go(Routes.home, extra: {'user_tariffs': <UserESimModel>[...userTariffs]} );
              }, text: 'Go to plans'),
            ],
          ),
        ),
      ),
    );
  }
}
