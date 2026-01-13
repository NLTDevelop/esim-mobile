import 'package:esim_mob_app/features/auto_top_up/data/data_sources/remote/auto_top_up_remote_data_source.dart';
import 'package:esim_mob_app/features/auto_top_up/data/models/dto/activation_top_up_dto.dart';
import 'package:esim_mob_app/features/auto_top_up/data/models/responses/activation_top_up_response.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/repositories/auto_top_up_repository.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_package_list_model.dart';

class AutoTopUpRepositoryImpl implements AutoTopUpRepository{
  final AutoTopUpRemoteDataSource _autoTopUpRemoteDataSource;

  const AutoTopUpRepositoryImpl({
    required final AutoTopUpRemoteDataSource autoTopUpRemoteDataSource,
  }) : _autoTopUpRemoteDataSource = autoTopUpRemoteDataSource;

  @override
  Future<UserESimPackageListModel> fetchAutoTopUpActivations({required int id}) async => await _autoTopUpRemoteDataSource.fetchAutoTopUpPackages(id: id);

  @override
  Future<ActivationTopUpResponse> updateActivationTopUp({required ActivationTopUpDto activationTopUpDto, required int id}) async => await  _autoTopUpRemoteDataSource.updateActivationTopUp(id: id, data: activationTopUpDto.toJson());
}