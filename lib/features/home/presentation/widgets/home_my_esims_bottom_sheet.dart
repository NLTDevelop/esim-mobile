import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/esim_plan_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeMyESimsBottomSheet extends StatelessWidget {
  const HomeMyESimsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final eSims = context.read<HomeBloc>().eSims;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).extension<ColorExtension>()!.cardBorder,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).extension<ColorExtension>()!.text,
                    size: 26,
                  ),
                ),
                const DefaultText.bodySmall(
                  'My eSims',
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  width: 26,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Flexible(
              child: ListView.separated(

                  itemBuilder: (context, index) {
                    return ESimPlanContainer(eSim: eSims[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: eSims.length),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: MediaQuery.of(context).padding.bottom + 10,),
              child: PrimaryButton(onTap: (){}, text: 'Add data', icon: Icon(Icons.add, size: 22, color: Theme.of(context).extension<ColorExtension>()!.background,),),
            )
          ],
        ),
      ),
    );
  }
}
