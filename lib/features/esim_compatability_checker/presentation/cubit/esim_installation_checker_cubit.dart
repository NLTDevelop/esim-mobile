import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:esim_compatibility/esim_compatibility.dart';

part 'esim_installation_checker_state.dart';
part 'esim_installation_checker_cubit.freezed.dart';

class EsimInstallationCheckerCubit extends Cubit<EsimInstallationCheckerState> {
  EsimInstallationCheckerCubit() : super(const EsimInstallationCheckerState.initial());

  checkSupportingESim() async{
    final bool? isESimSupported = await EsimCompatibility.isEsimCompatible();
    print('Is esim supported:');
    print(isESimSupported);

    emit(EsimInstallationCheckerState.finish(canInstallESim: isESimSupported ?? false));
  }

}
