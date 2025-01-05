import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../../core/api/error/exceptions.dart';
import '../model/listing_model.dart';

abstract class ListingRemoteDataSource {
  Future<List<ListingModel>> getListings(int campaignId);
}

class ListingRemoteDataSourceImpl implements ListingRemoteDataSource {
  final http.Client client;

  ListingRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ListingModel>> getListings(int campaignId) async {
    final response = await client.get(
      Uri.parse('https://api.travela.xyz/api/campaigns/$campaignId/listing'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return (jsonData['data'] as List)
          .map((item) => ListingModel.fromJson(item))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
