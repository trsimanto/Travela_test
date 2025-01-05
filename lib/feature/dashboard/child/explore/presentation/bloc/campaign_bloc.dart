import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/api/error/failures.dart';
import '../../../../../../core/api/usecases/no_params.dart';
import '../../domain/entity/campaign.dart';
import '../../domain/usecase/get_campaigns_usecase.dart';


part 'campaign_event.dart';
part 'campaign_state.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final GetCampaigns getCampaigns;

  CampaignBloc({required this.getCampaigns}) : super(CampaignInitial()) {
    on<GetCampaignsEvent>((event, emit) async {
      emit(CampaignLoading());

      final Either<Failure, List<Campaign>> result = await getCampaigns(NoParams());

      result.fold(
            (failure) => emit(CampaignError(message: _mapFailureToMessage(failure))),
            (campaigns) => emit(CampaignLoaded(campaigns: campaigns)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return "Server Error! Please try again later.";
    } else {
      return "An unexpected error occurred.";
    }
  }
}
