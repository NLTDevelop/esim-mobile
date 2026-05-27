
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/home/presentation/custom_painters/curve_painter.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/animated_toggler.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/top_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ActivationContainer extends StatelessWidget {
  const ActivationContainer({
    super.key,
    required this.dataInMb,
    required this.activationId,
    required this.title,
    required this.description,
    required this.isEnabled,
    required this.balanceInPercent,
    required this.onTopUp,
    required this.canTopUp,
    required this.canAutoTopUp,
    required this.country
  });

  final int activationId;
  final String dataInMb;
  final String title;
  final String description;
  final bool isEnabled;
  final String country;
  final double balanceInPercent;
  final Function() onTopUp;
  final bool canTopUp;
  final bool canAutoTopUp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: 80,
                height: 40,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: const Size(80, 40),
                      painter: CurvePainter(
                        progress: balanceInPercent,
                        progressColor: Theme.of(context).extension<ColorExtension>()!.primary,
                        backgroundColor: Theme.of(context).extension<ColorExtension>()!.divider
                      ),
                    ),
                    Align(alignment: Alignment.bottomCenter, child: SvgPicture.asset(AppIcons.eSim, width: 25, height: 25, colorFilter: ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.primary, BlendMode.srcIn),))
                  ],
                ),
              ),
              DefaultText.displaySmall(dataInMb, fontSize: 14,),
            ],
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                    children: [
                  //SvgPicture.network('https://myaccount.keepgo.com/img/flags/3x2/${country.toLowerCase()}.svg', width: 30, height: 20,),
                      DefaultText.displayMedium(country, textAlign: TextAlign.center, fontWeight: FontWeight.w600, fontSize: 14,),
                      const SizedBox(width: 6,),
                  DefaultText.displayMedium(title, textAlign: TextAlign.center, fontSize: 14,)]),
                const SizedBox(height: 10,),
                DefaultText.displaySmall(description, color: Theme.of(context).extension<ColorExtension>()!.hintText, fontWeight: FontWeight.w500, fontSize: 12,),
              ],
            ),
          ),
          ConstrainedBox(constraints: BoxConstraints(minWidth: 10, maxWidth: 100)),
          Column(
            children: [
              if(canAutoTopUp)
                AnimatedToggler(enabled: isEnabled, onTap: (){
                  context.push(Routes.autoTopUp, extra: {'esim_id': activationId, 'currency_code': context.read<AuthentificationBloc>().state.user.currencyCode,});
                },),
                const SizedBox(height: 10,),
              if(canTopUp)
                TopUpButton(onTap: onTopUp,),
            ],
          ),
        ],
      ),
    );
  }
}
