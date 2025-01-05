import 'package:equatable/equatable.dart';

import '../../domain/entity/listing.dart';

class ListingModel extends Listing {
  const ListingModel({
    required int id,
    required String title,
    required double price,
    required double averageRating,
    required int totalAverage,
    required String imageUrl,
  }) : super(
    id: id,
    title: title,
    price: price,
    averageRating: averageRating,
    totalAverage: totalAverage,
    imageUrl: imageUrl,
  );

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      averageRating: json['average_rating'].toDouble(),
      totalAverage: json['total_average'],
      imageUrl: (json['images'] as List).isNotEmpty ? (json['images'] as List).first['url'] : '',
    );
  }
}
