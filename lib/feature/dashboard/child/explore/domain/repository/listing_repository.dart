import 'package:dartz/dartz.dart';
import '../../../../../../core/api/error/failures.dart';

import '../entity/listing.dart';

abstract class ListingRepository {
  Future<Either<Failure, List<Listing>>> getListings(int campaignId);
}
