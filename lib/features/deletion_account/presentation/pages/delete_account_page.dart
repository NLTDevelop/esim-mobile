import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/features/deletion_account/presentation/bloc/delete_account_bloc.dart';
import 'package:esim_mob_app/features/deletion_account/presentation/widgets/delete_account_body.dart';
import 'package:esim_mob_app/features/deletion_account/presentation/widgets/success_deletion_account_widget.dart';
import 'package:esim_mob_app/features/profile/domain/use_cases/confirm_deletion_account_use_case.dart';
import 'package:esim_mob_app/features/profile/domain/use_cases/delete_account_use_case.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountBloc(
        confirmDeletionAccountUseCase:
        injector<ConfirmDeletionAccountUseCase>(),
        deleteAccountUseCase: injector<DeleteAccountUseCase>(),
      )..add(const DeleteAccountEvent.requestDeletionAccount()),
      child: DefaultScaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              context.pop(context.read<DeleteAccountBloc>().isAccountDeleted);
            },
            child: Icon(Icons.arrow_back_ios, size: 24, color: Theme.of(context).extension<ColorExtension>()!.text),
          ),
        ),
        body: BlocBuilder<DeleteAccountBloc,
            DeleteAccountState>(
          builder: (context, state) {
            return state.map(
                success: (_) => const SuccessDeletionAccountWidget(),
                loading: (_) => const LoadingState(),
                failure: (_) => DeleteAccountBody(),
                initial: (_) => DeleteAccountBody());
          },
        ),
      ),
    );
  }
}
