import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/deletion_account/presentation/bloc/delete_account_bloc.dart';
import 'package:esim_mob_app/features/deletion_account/presentation/widgets/delete_account_countdown.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class DeleteAccountBody extends StatelessWidget {
  DeleteAccountBody({super.key});

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFe5e5e5), width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color(0xFF0d6efd), width: 2),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color(0xFFe5e5e5),
      ),
    );

    return BlocListener<DeleteAccountBloc, DeleteAccountState>(
  listener: (context, state) {
    state.maybeMap(orElse: (){}, success: (s) => context.read<AuthentificationBloc>().add(const AuthentificationEvent.logout()));
  },
  child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DefaultText.labelLarge(
              'Confirm deletion your account with code which was sent on your email', textAlign: TextAlign.center,),
          const SizedBox(
            height: 26,
          ),
          BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    length: 6,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    // validator: (s) {
                    //   return s == '2222' ? null : 'Pin is incorrect';
                    // },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) {
                      context.read<DeleteAccountBloc>().add(DeleteAccountEvent.sendCode(code: pin));
                    },
                  ),
                  const SizedBox(height: 14,),
                  state.isTimerEnded == false ?
                    DeleteAccountCountdown(initialDuration: Duration(seconds: context.read<DeleteAccountBloc>().countOfSeconds)) : PrimaryButton(onTap: (){
                    context.read<DeleteAccountBloc>().add(const DeleteAccountEvent.requestDeletionAccount());
                  }, text: 'Send again'),
                  if(state.mapOrNull(failure: (_) => true) != null)
                    DefaultText.displaySmall('Wrong code. Try again', color: Theme.of(context).extension<ColorExtension>()!.error,),
                  // const SizedBox(height: 14,),
                ],
              );
            },
          )

        ],
      ),
    ),
);
  }
}
