import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreDataCard extends StatelessWidget {
  const StoreDataCard(
      {super.key,
      required this.name,
      required this.isLocal,
      required this.onTap, this.code});

  final String name;
  final String? code;
  final bool isLocal;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
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
            isLocal
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SvgPicture.network(
                        'https://myaccount.keepgo.com/img/flags/3x2/${code!.toLowerCase()}.svg',
                        height: 24,
                      ) ,
                    )
                  : Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              height: 32,
                              width: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context)
                                      .extension<ColorExtension>()!
                                      .toggleCircle),
                              child: SvgPicture.asset(
                                AppIcons.world,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context)
                                        .extension<ColorExtension>()!
                                        .secondaryText,
                                    BlendMode.srcIn),
                              )),
                        ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: DefaultText.titleSmall(
                        name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).extension<ColorExtension>()!.text,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 3,
                    // ),
                    // DefaultText.labelSmall('Price: from $price \$',
                    //     overflow: TextOverflow.visible,
                    //     maxLines: 1,
                    //     fontWeight: FontWeight.w500,
                    //     color:
                    //         Theme.of(context).extension<ColorExtension>()!.text)
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
