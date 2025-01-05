import 'package:dartz/dartz.dart';

import '../../../../../../core/api/error/exceptions.dart';
import '../../../../../../core/api/error/failures.dart';
import '../../../../../../core/api/network/network_info.dart';
import '../../domain/entity/campaign.dart';
import '../../domain/repository/campaign_repository.dart';
import '../data_source/campaign_remote_data_source.dart';

class CampaignRepositoryImpl implements CampaignRepository {
  final CampaignRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CampaignRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Campaign>>> getCampaigns() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaigns = await remoteDataSource.getCampaigns();
        return Right(remoteCampaigns);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
