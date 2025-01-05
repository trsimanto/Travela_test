import 'package:dartz/dartz.dart';

import '../../../../../../core/api/error/failures.dart';
import '../entity/campaign.dart';


abstract class CampaignRepository {
  Future<Either<Failure, List<Campaign>>> getCampaigns();
}
