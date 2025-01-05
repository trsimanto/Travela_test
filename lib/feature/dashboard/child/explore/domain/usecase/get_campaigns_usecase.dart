import 'package:dartz/dartz.dart';
import '../../../../../../core/api/error/failures.dart';
import '../../../../../../core/api/usecases/no_params.dart';
import '../../../../../../core/api/usecases/usecase.dart';
import '../entity/campaign.dart';
import '../repository/campaign_repository.dart';




class GetCampaigns implements UseCase<List<Campaign>, NoParams> {
  final CampaignRepository repository;

  GetCampaigns(this.repository);

  @override
  Future<Either<Failure, List<Campaign>>> call(NoParams params) async {
    return await repository.getCampaigns();
  }
}
