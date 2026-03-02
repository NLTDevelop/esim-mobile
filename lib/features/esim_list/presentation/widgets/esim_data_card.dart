
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ESimDataCard extends StatelessWidget {
  const ESimDataCard(
      {super.key,
        required this.eSim,
        required this.onTap,});

  final PlanModel eSim;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final String? currencyCode = context.read<AuthentificationBloc>().state.user.currencyCode;

    return InkWell(
      onTap: onTap,
      child: Container(
          height: 68,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                  color:
                  Theme.of(context).extension<ColorExtension>()!.cardBorder,
                  width: 2),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(0, 32, 70, .15),
                    offset: Offset(0, 3),
                    blurRadius: 5)
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              eSim.image != null ? eSim.image!.endsWith('svg')
                  ? Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SvgPicture.network(
                  eSim.image!,
                  height: 24,
                ) ,
              )
                  : Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.network(eSim.image!, height: 24,),
              ) : Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).extension<ColorExtension>()!.splashBackground,),
                child: SvgPicture.asset(AppIcons.world, width: 20, height: 20, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),)
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: DefaultText.titleSmall(
                        eSim.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).extension<ColorExtension>()!.text,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    DefaultText.labelSmall('Price: from ${eSim.packages.map<double>((e) => e.price).toList().first} ${currencyCode != null ? currencyCode =='EUR' ? '€' : '\$' : '\$'}',
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                        fontWeight: FontWeight.w500,
                        color:
                            Theme.of(context).extension<ColorExtension>()!.text)
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 24,
              ),
            ],
          )),
    );
  }
}
