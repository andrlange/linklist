import 'package:freezed_annotation/freezed_annotation.dart';

part 'CategoryEntity.freezed.dart';
part 'CategoryEntity.g.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required BigInt index,
    required String title,
  }) = _CategoryEntity;

  factory CategoryEntity.fromJson(Map<String, Object?> json) => _$CategoryEntityFromJson(json);
}
