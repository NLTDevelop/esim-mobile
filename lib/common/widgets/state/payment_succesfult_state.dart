import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:esim_mob_app/features/user/data/data_sources/local/user_local_data_source.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PaymentSuccessfulState extends StatelessWidget {
  const PaymentSuccessfulState({super.key, required this.tariffModel});

  final PackageModel tariffModel;

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
                'Оплата пройшла успішно!',
              ),
              const SizedBox(
                height: 14,
              ),
              DefaultText.bodySmall('Test'),
              const SizedBox(
                height: 6,
              ),
              DefaultText.displayMedium(
                  'Start date: ${DateFormat.yMd().format(DateTime.now())}', textAlign: TextAlign.center,),
              const SizedBox(height: 6,),
              DefaultText.displayMedium('End date: ${DateFormat.yMd().format(DateTime.now().add(Duration(days: tariffModel.validDays ?? 0)))}', textAlign: TextAlign.center,),
              const SizedBox(
                height: 60,
              ),
              PrimaryButton(onTap: () async{
                final authBloc = context.read<AuthentificationBloc>();
                List<UserESimModel> userTariffs = authBloc.state.user.userESims;
                //await injector<UserLocalDataSource>().saveUser(AuthenticatedUserModel(id: 1, email: authBloc.state.user.userEmail, eSims: [...authBloc.state.user.userTariffs, tariffModel], currency: 'USD', balance: 0));
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
