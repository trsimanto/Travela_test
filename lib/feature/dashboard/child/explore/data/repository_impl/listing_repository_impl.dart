import 'package:dartz/dartz.dart';
import '../../../../../../core/api/error/exceptions.dart';
import '../../../../../../core/api/error/failures.dart';
import '../../domain/entity/listing.dart';
import '../../domain/repository/listing_repository.dart';
import '../data_source/listing_remote_data_source.dart';

class ListingRepositoryImpl implements ListingRepository {
  final ListingRemoteDataSource remoteDataSource;

  ListingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Listing>>> getListings(int campaignId) async {
    try {
      final listings = await remoteDataSource.getListings(campaignId);
      return Right(listings);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
