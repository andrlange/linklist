import 'package:frontend/features/linklist/domain/entities/CategoryEntity.dart';

import '../../features/linklist/domain/entities/LinkEntity.dart';
import '../../generated/api/BackendService.swagger.dart';

class DtoEntityUtil {
  static LinkEntity dtoToEntity(LinkDto dto) {
    return LinkEntity(
      id: dto.id ?? 0,
      url: dto.url ?? "",
      title: dto.title ?? "",
      description: dto.description ?? "",
      active: dto.active ?? false,
      category: dto.category ?? 0,
      contact: dto.contact ?? "",
      dislikes: dto.dislikes ?? 0,
      likes: dto.likes ?? 0,
      image: dto.image ?? "",
      support: dto.support ?? false,
      categoryTitle: dto.categoryTitle ?? "",
    );
  }

  static CategoryDto entityToDto(CategoryEntity entity) {
    return CategoryDto(
      id: entity.index,
      title: entity.title,
    );
  }
}
