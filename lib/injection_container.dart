import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/api/network/network_info.dart';
import 'feature/dashboard/child/explore/data/data_source/campaign_remote_data_source.dart';
import 'feature/dashboard/child/explore/data/data_source/listing_remote_data_source.dart';
import 'feature/dashboard/child/explore/data/repository_impl/campaign_repository_impl.dart';
import 'feature/dashboard/child/explore/data/repository_impl/listing_repository_impl.dart';
import 'feature/dashboard/child/explore/domain/repository/campaign_repository.dart';
import 'feature/dashboard/child/explore/domain/repository/listing_repository.dart';
import 'feature/dashboard/child/explore/domain/usecase/get_campaigns_usecase.dart';
import 'feature/dashboard/child/explore/domain/usecase/get_listings_usecase.dart';
import 'feature/dashboard/child/explore/presentation/bloc/campaign_bloc.dart';
import 'feature/dashboard/child/explore/presentation/bloc/listing_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register Connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  // Register the HTTP client
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // Bloc
  sl.registerFactory(() => CampaignBloc(getCampaigns: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetCampaigns(sl()));

  // Repositories
  sl.registerLazySingleton<CampaignRepository>(
        () => CampaignRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<CampaignRemoteDataSource>(
        () => CampaignRemoteDataSourceImpl(client: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));



  // Bloc
  sl.registerFactory(() => ListingBloc(getListings: sl()));

  // Use Case
  sl.registerLazySingleton(() => GetListings(sl()));

  // Repository
  sl.registerLazySingleton<ListingRepository>(
        () => ListingRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<ListingRemoteDataSource>(
        () => ListingRemoteDataSourceImpl(client: sl()),
  );


}
