import '../../domain/entity/campaign.dart';

class CampaignModel extends Campaign {
  const CampaignModel({
    required int id,
    required String title,
    required String displayType,
    required String status,
    required String image,
  }) : super(
    id: id,
    title: title,
    displayType: displayType,
    status: status,
    image: image
  );

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'],
      title: json['title'],
      displayType: json['display_type'],
      status: json['status'],
      image: json['image']

    );
  }
}
