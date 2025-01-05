import 'package:dartz/dartz.dart';

import '../../../../../../core/api/error/failures.dart';
import '../../../../../../core/api/usecases/usecase.dart';
import '../entity/listing.dart';
import '../repository/listing_repository.dart';

class GetListings implements UseCase<List<Listing>, int> {
  final ListingRepository repository;

  GetListings(this.repository);

  @override
  Future<Either<Failure, List<Listing>>> call(int params) async {
    return await repository.getListings(params);
  }
}
