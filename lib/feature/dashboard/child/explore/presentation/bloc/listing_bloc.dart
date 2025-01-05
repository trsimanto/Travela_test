import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/api/error/failures.dart';
import '../../domain/usecase/get_listings_usecase.dart';
import 'listing_event.dart';
import 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final GetListings getListings;

  ListingBloc({required this.getListings}) : super(ListingInitial()) {
    on<FetchListingsEvent>((event, emit) async {
      emit(ListingLoading());
      final result = await getListings(event.campaignId);
      result.fold(
            (failure) => emit(ListingError(_mapFailureToMessage(failure))),
            (listings) => emit(ListingLoaded(listings)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) return 'Server Failure';
    return 'Unexpected Error';
  }
}
