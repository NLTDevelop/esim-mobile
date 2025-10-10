import 'package:esim_mob_app/features/localization/presentation/cubit/localization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LocaleKeys { welcome, home, store, help, profile }

extension LocaleKeysExtension on LocaleKeys {
  String tr(BuildContext context) {
    return context.read<LocalizationCubit>().resources?[name] ?? '';
  }
}