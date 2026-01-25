import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/snackbar/default_snackbar.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/contact_us/domain/use_cases/send_message_to_contact_use_case.dart';
import 'package:esim_mob_app/features/contact_us/presentation/bloc/contact_us_cubit.dart';
import 'package:esim_mob_app/features/contact_us/presentation/widgets/contact_us_body.dart';
import 'package:esim_mob_app/features/contact_us/presentation/widgets/success_send_message.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const DefaultText.bodySmall('Contact us'),
        leading: GestureDetector(onTap: () {
          context.pop();
        },
          child: Icon(Icons.arrow_back_ios, size: 30,
            color: Theme.of(context).extension<ColorExtension>()!.text,),),
      ),
      body: BlocProvider(
        create: (context) => ContactUsCubit(sendMessageToContactUseCase: injector<SendMessageToContactUseCase>()),
        child: BlocConsumer<ContactUsCubit, ContactUsState>(
          listener: (context, state){
            state.mapOrNull(failure: (s) => DefaultSnackBar.show(context: context, title: 'Error', message: s.message, displayDuration: const Duration(milliseconds: 2000)));
          },
          builder: (context, state) {
            return state.map(initial: (_) => const ContactUsBody(), success: (_) => const SuccessSendMessage(), loading: (_) => const LoadingState(), failure: (_) => const ContactUsBody());
          }
        ),
      ),
    );
  }
}
