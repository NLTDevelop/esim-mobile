


import 'package:esim_mob_app/features/store/data/models/plans_response_model.dart';

abstract interface class PlanESimRepository {
  Future<PlansResponseModel> fetchLocalPlansESim({
    required final String countryCode,
    final String? currencyCode,
  });

  Future<PlansResponseModel> fetchRegionalPlansESim({
    required final String regionalId,
    final String? currencyCode,
  });


}
