import 'package:equatable/equatable.dart';

abstract class ListingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchListingsEvent extends ListingEvent {
  final int campaignId;

  FetchListingsEvent(this.campaignId);

  @override
  List<Object?> get props => [campaignId];
}
