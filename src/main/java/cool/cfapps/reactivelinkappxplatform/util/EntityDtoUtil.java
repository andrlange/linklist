package cool.cfapps.reactivelinkappxplatform.util;

import cool.cfapps.reactivelinkappxplatform.dto.*;
import cool.cfapps.reactivelinkappxplatform.entity.CategoryEntity;
import cool.cfapps.reactivelinkappxplatform.entity.LinkEntity;
import org.springframework.beans.BeanUtils;

public class EntityDtoUtil {
    public static CategoryDto toDto(CategoryEntity entity) {
        CategoryDto dto = new CategoryDto();
        BeanUtils.copyProperties(entity, dto);
        return dto;
    }

    public static CategoryEntity toEntity(CategoryDto dto) {
        CategoryEntity entity = new CategoryEntity();
        BeanUtils.copyProperties(dto, entity);
        return entity;
    }

    public static CategoryEntity toEntity(CreateCategoryDto dto) {
        CategoryEntity entity = new CategoryEntity();
        BeanUtils.copyProperties(dto, entity);
        return entity;
    }

    public static LinkDto toDto(LinkEntity entity) {
        LinkDto dto = new LinkDto();
        BeanUtils.copyProperties(entity, dto);
        return dto;
    }

    public static LinkEntity toEntity(LinkDto dto) {
        LinkEntity entity = new LinkEntity();
        BeanUtils.copyProperties(dto, entity);
        return entity;
    }

    public static LinkEntity toEntity(CreateLinkDto dto) {
        LinkDto linkDto = new LinkDto();
        BeanUtils.copyProperties(dto, linkDto);
        return toEntity(linkDto);
    }

    public static LinkEntity toEntity(UpdateLinkDto dto) {
        LinkDto linkDto = new LinkDto();
        BeanUtils.copyProperties(dto, linkDto);
        return toEntity(linkDto);
    }
}
