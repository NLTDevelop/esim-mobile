import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/add_balance/data/model/payent_getaway_type.dart';
import 'package:esim_mob_app/features/add_balance/presentation/bloc/add_balance_cubit.dart';
import 'package:esim_mob_app/features/add_balance/presentation/bloc/add_balance_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMoneyContainer extends StatelessWidget {
  AddMoneyContainer({super.key});

  final FocusNode _focusNode = FocusNode();

  InputBorder _getDefaultInputBorder(BuildContext context) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
            color: Theme.of(context).extension<ColorExtension>()!.cardBorder,
            width: 2),
      );

  InputBorder _getDefaultErrorInputBorder(BuildContext context) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
            color: Theme.of(context).extension<ColorExtension>()!.error,
            width: 2),
      );

  InputBorder _getDefaultFocusedInputBorder(BuildContext context) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
            color: Theme.of(context).extension<ColorExtension>()!.primary,
            width: 2),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ColorExtension>()!.background,
            borderRadius: BorderRadius.circular(12),
            border: Border(
                top: BorderSide(
                    color:
                    Theme.of(context).extension<ColorExtension>()!.primary,
                    width: 2)),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 32, 70, .15),
                  offset: Offset(0, 3),
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.add_box_outlined,
                  color: Theme.of(context).extension<ColorExtension>()!.text,
                  size: 22,
                ),
                const SizedBox(
                  width: 8,
                ),
                const DefaultText.bodySmall('Add Money'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const DefaultText.displaySmall('Select Getaway'),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<AddBalanceCubit, AddBalanceState>(
              builder: (context, state) {
                return PopupMenuButton<PaymentGetawayType>(
                  initialValue: state.paymentGetawayType,
                  onSelected: context.read<AddBalanceCubit>().onChangePaymentGetaway,
                  itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<PaymentGetawayType>>[
                    const PopupMenuItem<PaymentGetawayType>(
                        value: PaymentGetawayType.stripe,
                        child: DefaultText.displaySmall('Stripe')),
                  ],
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Theme
                                  .of(context)
                                  .primaryColor, width: 2)),
                      child: DefaultText.displaySmall('${state.paymentGetawayType.name.toUpperCase()[0]}${state.paymentGetawayType.name.substring(1)}')),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultText.displaySmall('Amount', color: Theme.of(context).extension<ColorExtension>()!.text,),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onTap: () {},
              onFieldSubmitted: context.read<AddBalanceCubit>().onChangePaymentValue,
              onTapOutside: (event){
                _focusNode.unfocus();
                ///context.read<AddBalanceCubit>().onChangePaymentValue();
              },
              initialValue: '5.00',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: _getDefaultInputBorder(context),
                errorBorder: _getDefaultErrorInputBorder(context),
                disabledBorder: _getDefaultInputBorder(context),
                focusedBorder: _getDefaultFocusedInputBorder(context),
                focusedErrorBorder: _getDefaultErrorInputBorder(context),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                fillColor:
                Theme.of(context).extension<ColorExtension>()!.background,
              ),
            ),
          ],
        ));
  }
}
