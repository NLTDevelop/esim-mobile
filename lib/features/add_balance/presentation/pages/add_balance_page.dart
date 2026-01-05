import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/features/add_balance/presentation/bloc/add_balance_cubit.dart';
import 'package:esim_mob_app/features/add_balance/presentation/widgets/add_balance_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddBalancePage extends StatelessWidget {
  const AddBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBalanceCubit(),
      child: DefaultScaffold(
        appBar: AppBar(
          leading: GestureDetector(onTap: () {
            context.pop();
          },
              child: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).extension<ColorExtension>()!.text,)),
        ),
        body: const AddBalanceBody(),
      ),
    );
  }
}
