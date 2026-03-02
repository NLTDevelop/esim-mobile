


import 'package:esim_mob_app/features/store/data/models/plan_model.dart';

abstract interface class PlanESimRepository {
  Future<List<PlanModel>> fetchLocalPlansESim({
    required final String countryCode,
    final String? currencyCode,
  });

  Future<List<PlanModel>> fetchRegionalPlansESim({
    required final String regionalId,
    final String? currencyCode,
  });


}
