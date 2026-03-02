
import 'package:country_codes/country_codes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/checkout/presentation/widgets/order_summary_data_row.dart';
import 'package:esim_mob_app/features/top_up/presentation/bloc/topup_bloc.dart';
import 'package:esim_mob_app/features/top_up/presentation/widgets/top_up_package_container.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class TopUpBody extends StatelessWidget {
  const TopUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final authentificationBloc = context.read<AuthentificationBloc>();
    return  SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40),
          child: BlocBuilder<TopupBloc, TopupState>(
  builder: (context, state) {
    return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context)
                          .extension<ColorExtension>()!
                          .background),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(right: 50),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...state.packages.asMap().entries.map((e) => TopUpPackageContainer(
                                onTap: (){
                                  context.read<TopupBloc>().add(TopupEvent.selectPackage(index: e.key));
                                },
                                title: e.value.bundleTitle,
                                dataInMb: e.value.dataInMB.toString(),
                                validDays: e.value.validDays ?? 0,
                                price: '${e.value.price} ${(authentificationBloc.state.user.currencyCode ?? 'USD') == 'EUR' ? '€' : '\$'}',
                                isSelected: e.key == state.selectedIndex
                            ))
                          ],
                        ),
                      ),
                      const DefaultText.bodySmall('Payment Details'),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 8),
                          margin: const EdgeInsets.symmetric(vertical: 16.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context)
                                  .extension<ColorExtension>()!
                                  .cardBorder),
                          child: Row(
                            children: [
                              Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: SvgPicture.asset(AppIcons.world,width: 30, height: 24 )),
                              const SizedBox(
                                width: 10,
                              ),
                              DefaultText.displaySmall(
                                'Georgia',
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          )),
                      OrderSummaryDataRow(data: '${(state.packages[state.selectedIndex].dataInMB / 1024).toStringAsFixed(2)} GB', typeName: 'Plan'),
                      const OrderSummaryDataRow(
                          data: 'Data only', typeName: 'Type'),
                      OrderSummaryDataRow(
                          data: '${state.packages[state.selectedIndex].validDays} days', typeName: 'Duration'),
                      OrderSummaryDataRow(
                        data: CountryCodes.detailsForLocale().name ?? 'Unknown',
                        typeName: 'Tax country',
                        dataTextDecoration: TextDecoration.underline,
                      ),
                      Divider(
                        color:
                        Theme.of(context).extension<ColorExtension>()!.divider,
                        height: 10,
                      ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OrderSummaryDataRow(
                        data: '${authentificationBloc.state.user.currencyCode != null ? authentificationBloc.state.user.currencyCode == 'EUR' ? 'EU€' : 'US\$' : 'US\$'}${state.packages[state.selectedIndex].price}', typeName: 'Subtotal'),
                    // AnimatedCrossFade(firstChild: Container(), secondChild: OrderSummaryDataRow(data: '-US\$${blocInternal.discount}', typeName: 'Coupon', couponWidget: Container(
                    //   padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    //   margin: const EdgeInsets.only(left: 8),
                    //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).extension<ColorExtension>()!.cardBorder), child: Row(
                    //     children: [
                    //       DefaultText.displaySmall(bloc.promoCode),
                    //       const SizedBox(width: 7,),
                    //       GestureDetector(
                    //         onTap: blocInternal.deletePromoCode,
                    //         child: Icon(Icons.close, color: Theme.of(context).extension<ColorExtension>()!.text, size: 22,),
                    //       )
                    //     ],
                    //   ),
                    // ),), crossFadeState: state.isOpenPromoCode ? CrossFadeState.showSecond : CrossFadeState.showFirst, duration: const Duration(milliseconds: 300)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const DefaultText.bodySmall(
                            'Total',
                            fontWeight: FontWeight.w600,
                          ),
                          DefaultText.bodySmall(
                            '${authentificationBloc.state.user.currencyCode != null ? authentificationBloc.state.user.currencyCode == 'EUR' ? 'EU€' : 'US\$' : 'US\$'} ${state.packages[state.selectedIndex].price}',
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.zero,
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: (){},
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context)
                                      .extension<ColorExtension>()!
                                      .text)),
                          child: const DefaultText.displayMedium('Get a promocode', textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                    //AnimatedCrossFade(firstChild: Container(), secondChild: OrderCouponTextField(textEditingController: blocInternal.promoCodeTextEditingController, onFinish: blocInternal.onCheckPromoCode), crossFadeState: state.isOpenPromoCode ? CrossFadeState.showSecond : CrossFadeState.showFirst, duration: const Duration(milliseconds: 300))
                  ],
                )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 10,
                      child: PrimaryButton(
                        onTap: () {

                        },
                        text: 'Add balance & Pay',
                        icon: Icon(
                          Icons.wallet,
                          size: 20,
                          color: Theme.of(context)
                              .extension<ColorExtension>()!
                              .background,
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 10,
                      child: PrimaryButton(
                          onTap: () async {
                            // final purchaseResult = await injector<PurchaseESimByCardUseCase>().call(PurchaseESimParams(type: context.read<TopupBloc>().type, location: context.read<TopupBloc>().location, package: context.read<TopupBloc>().tariff.packageId, promoCode: ''));
                            // context.push(Routes.payment, extra: {'url': purchaseResult.redirectUrl, 'trx': purchaseResult.trx});
                          },
                          text: 'Quick Pay by Card',
                          icon: Icon(
                            Icons.payment,
                            size: 20,
                            color: Theme.of(context)
                                .extension<ColorExtension>()!
                                .background,
                          ))),
                ],
              )
            ],
          );
  },
),
        ),
      ),
    );
  }
}
