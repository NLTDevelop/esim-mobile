
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/home/presentation/custom_painters/curve_painter.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/animated_toggler.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/top_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivationContainer extends StatelessWidget {
  const ActivationContainer({
    super.key,
    required this.dataInMb,
    required this.title,
    required this.description,
    required this.isEnabled,
    required this.balanceInPercent,
    required this.onTopUp
  });

  final String dataInMb;
  final String title;
  final String description;
  final bool isEnabled;
  final double balanceInPercent;
  final Function() onTopUp;

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
              DefaultText.displaySmall(dataInMb),
            ],
          ),
          const SizedBox(width: 20,),
          Column(
            children: [
              DefaultText.displayMedium(title),
              const SizedBox(height: 10,),
              DefaultText.displaySmall(description, color: Theme.of(context).extension<ColorExtension>()!.hintText, fontWeight: FontWeight.w400,),
            ],
          ),
          const Spacer(),
          Column(
            children: [
                AnimatedToggler(enabled: isEnabled, onTap: (){},),
                const SizedBox(height: 10,),
                TopUpButton(),
            ],
          ),
        ],
      ),
    );
  }
}
