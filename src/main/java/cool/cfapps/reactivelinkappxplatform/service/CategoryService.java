package cool.cfapps.reactivelinkappxplatform.service;

import cool.cfapps.reactivelinkappxplatform.dto.CategoryDto;
import cool.cfapps.reactivelinkappxplatform.dto.CreateCategoryDto;
import cool.cfapps.reactivelinkappxplatform.repository.CategoryRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import cool.cfapps.reactivelinkappxplatform.util.EntityDtoUtil;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class CategoryService {

    @Bean
    public void initCache(){
        log.info("init cache");
        findAll().subscribe(entity -> {log.info("loaded:"+entity+" into cache");});
    }

    private final List<CategoryDto> categoryCache = new ArrayList<>();

    private boolean cacheOutdated = true;

    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public Flux<CategoryDto> findAll() {
        // cache all categories for performance mapping
        categoryCache.clear();
        return categoryRepository.findAll().map(entity -> {
            categoryCache.add(EntityDtoUtil.toDto(entity));
            return entity;
        }).map(EntityDtoUtil::toDto);
    }

    public Mono<CategoryDto> getCategoryById(long id) {
        return categoryRepository.findById(id).map(EntityDtoUtil::toDto);
    }


    public Flux<CategoryDto> getCategoryByName(String title) {
        return categoryRepository.findByTitleIgnoreCase(title).map(EntityDtoUtil::toDto);
    }


    public Mono<CategoryDto> createCategory(Mono<CreateCategoryDto> categoryDto) {
        cacheOutdated = true;
        return categoryDto
                .map(EntityDtoUtil::toEntity)
                .flatMap(categoryRepository::save)
                .map(EntityDtoUtil::toDto);
    }

    public Mono<CategoryDto> updateCategory(long id, Mono<CategoryDto> categoryDto) {
        cacheOutdated = true;
        return categoryRepository.findById(id)
                .flatMap(u -> categoryDto
                        .map(EntityDtoUtil::toEntity)
                        .doOnNext(category -> category.setId(id))
                        .flatMap(categoryRepository::save)
                        .map(EntityDtoUtil::toDto));
    }

    public Mono<Void> deleteCategory(long id) {
        cacheOutdated = true;
        return categoryRepository.deleteById(id);
    }

    public Mono<Boolean> hasCategories() {
        try {
            return categoryRepository.count().map(count -> count > 0);
        } catch (Exception e) {
            log.error("accessing schema linklist:" + e.getMessage());
            return Mono.just(false);
        }
    }

    public Mono<CategoryDto> getCategoryByIdFromCache(long id) {
        if (cacheOutdated) {
            var result = findAll().filter(c -> c.getId() == id).next();
            cacheOutdated = false;
            return result;
        }

        if (categoryCache.stream().anyMatch(c -> c.getId() == id)) {
            List<CategoryDto> cl = categoryCache.stream()
                    .filter(c -> c.getId() == id).toList();
            if (cl.size() > 0) {
                return Mono.just(cl.get(0));
            }
        }

        return Mono.empty();
    }

    public String getCategoryTitleById(long id) {
        if (categoryCache.stream().anyMatch(c -> c.getId() == id)) {
            List<CategoryDto> cl = categoryCache.stream()
                    .filter(c -> c.getId() == id).toList();
            if (cl.size() > 0) {
                return cl.get(0).getTitle();
            }
        }
        return "";
    }

    public Flux<CategoryDto> getAllFromCache() {
        List<CategoryDto> copy = List.copyOf(categoryCache);
        return Flux.fromStream(copy.stream());
    }
}

