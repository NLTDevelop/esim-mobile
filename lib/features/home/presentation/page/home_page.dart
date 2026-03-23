import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/features/history/domain/use_cases/fetch_history_use_case.dart';
import 'package:esim_mob_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:esim_mob_app/features/home/domain/use_cases/fetch_user_esim_use_case.dart';
import 'package:esim_mob_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_body.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userTariffs});

  final List<UserESimModel> userTariffs;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final bloc = HomeBloc(userTariffs: userTariffs, fetchUserESimUseCase: injector<FetchUserESimUseCase>());
              bloc.add(HomeEvent.fetchESims(tariffs: userTariffs));
              return bloc;
            },
          ),
        ],
        child: const HomeBody(),
      ),
    );
  }
}
