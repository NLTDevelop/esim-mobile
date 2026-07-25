import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/dividers/dashed_divider.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/add_balance/presentation/bloc/add_balance_cubit.dart';
import 'package:esim_mob_app/features/add_balance/presentation/bloc/add_balance_state.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryContainer extends StatelessWidget {
  const SummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      decoration: BoxDecoration(
        color: Theme.of(context).extension<ColorExtension>()!.background,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          top: BorderSide(
            color: Theme.of(context).extension<ColorExtension>()!.primary,
            width: 2,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 32, 70, .15),
            offset: Offset(0, 3),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.summarize,
                color: Theme.of(context).extension<ColorExtension>()!.text,
                size: 22,
              ),
              const SizedBox(width: 8),
              const DefaultText.bodySmall('Summary'),
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<AddBalanceCubit, AddBalanceState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).extension<ColorExtension>()!.cardBorder,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText.displaySmall(
                          'Amount',
                          color: Theme.of(
                            context,
                          ).extension<ColorExtension>()!.text,
                        ),
                        BlocBuilder<
                          AuthentificationBloc,
                          AuthentificationState
                        >(
                          builder: (context, st) {
                            return DefaultText.displaySmall(
                              '${st.user.currencyCode == 'EUR' ? '€' : '\$'} ${state.paymentValue.toStringAsFixed(2)}',
                              color: Theme.of(
                                context,
                              ).extension<ColorExtension>()!.text,
                            );
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DashedDivider(
                        height: 1,
                        color: Theme.of(
                          context,
                        ).extension<ColorExtension>()!.hintText,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText.bodySmall(
                          'Payable',
                          color: Theme.of(
                            context,
                          ).extension<ColorExtension>()!.text,
                        ),
                        BlocBuilder<
                          AuthentificationBloc,
                          AuthentificationState
                        >(
                          builder: (context, st) {
                            return DefaultText.bodySmall(
                              '${st.user.currencyCode == 'EUR' ? '€' : '\$'} ${state.paymentValue.toStringAsFixed(2)}',
                              color: Theme.of(
                                context,
                              ).extension<ColorExtension>()!.text,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
