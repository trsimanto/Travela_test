import 'package:equatable/equatable.dart';

class Campaign extends Equatable {
  final int id;
  final String title;
  final String displayType;
  final String status;
  final String image;

  const Campaign({
    required this.id,
    required this.title,
    required this.displayType,
    required this.status,
    required this.image,
  });

  @override
  List<Object?> get props => [id, title, displayType, status, image];
}
