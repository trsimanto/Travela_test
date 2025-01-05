import 'package:equatable/equatable.dart';

import '../../domain/entity/listing.dart';

abstract class ListingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ListingInitial extends ListingState {}

class ListingLoading extends ListingState {}

class ListingLoaded extends ListingState {
  final List<Listing> listings;

  ListingLoaded(this.listings);

  @override
  List<Object?> get props => [listings];
}

class ListingError extends ListingState {
  final String message;

  ListingError(this.message);

  @override
  List<Object?> get props => [message];
}
