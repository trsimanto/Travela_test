import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../../core/api/error/exceptions.dart';
import '../model/campaign_model.dart';

abstract class CampaignRemoteDataSource {
  Future<List<CampaignModel>> getCampaigns();
}

class CampaignRemoteDataSourceImpl implements CampaignRemoteDataSource {
  final http.Client client;

  CampaignRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CampaignModel>> getCampaigns() async {
    final response = await client.get(
      Uri.parse('https://api.travela.xyz/api/campaigns'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      return data.map((json) => CampaignModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
