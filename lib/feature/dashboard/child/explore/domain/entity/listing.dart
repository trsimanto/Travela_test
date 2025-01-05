import 'package:equatable/equatable.dart';

class Listing extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final double? averageRating;
  final int? totalAverage;
  final String? imageUrl;

  const Listing({
    required this.id,
    required this.title,
    required this.price,
    required this.averageRating,
    required this.totalAverage,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, price, averageRating, totalAverage, imageUrl];
}
