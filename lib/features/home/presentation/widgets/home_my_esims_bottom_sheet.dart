import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/square_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/add_balance_first_container.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_add_balance_widget.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/latest_activation_list.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeMyESimsBottomSheet extends StatelessWidget {
  const HomeMyESimsBottomSheet({super.key, required this.tariffs});

  final List<PackageModel> tariffs;

  @override
  Widget build(BuildContext context) {
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
                  'My eSIMs',
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  width: 26,
                ),
              ],
            ),
            const HomeAddBalanceWidget(),
            const SizedBox(height: 14,),
            const AddBalanceFirstContainer(),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.04,
            // ),
            // Flexible(
            //   child: ListView.separated(
            //
            //       itemBuilder: (context, index) {
            //         return ESimPlanContainer(eSim: tariffs[index]);
            //       },
            //       separatorBuilder: (context, index) =>
            //           const SizedBox(height: 20),
            //       itemCount: tariffs.length),
            // ),
            const SizedBox(height: 20,),
            LatestActivationList(),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: MediaQuery.of(context).padding.bottom + 10,),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SquareButton(onTap: (){ context.push(Routes.store);}, title: 'Add data', icon: Icon(Icons.add, color: Theme.of(context).extension<ColorExtension>()!.primary),),
                  SquareButton(onTap: (){
                    context.push(Routes.history, extra: { 'transactions': <TransactionModel>[]});
                  }, title: 'Payment history', icon: SvgPicture.asset(AppIcons.history, colorFilter: ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.primary, BlendMode.srcIn),)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
