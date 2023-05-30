import 'package:freezed_annotation/freezed_annotation.dart';

part 'LinkEntity.freezed.dart';
part 'LinkEntity.g.dart';

@freezed
class LinkEntity with _$LinkEntity {
  const factory LinkEntity({
    required int id,
    required int category,
    required String title,
    required String url,
    required String description,
    required bool support,
    required String contact,
    required String image,
    required int likes,
    required int dislikes,
    required bool active,
    required String categoryTitle,
  }) = _LinkedEntity;

  factory LinkEntity.fromJson(Map<String, Object?> json) => _$LinkEntityFromJson(json);
}
