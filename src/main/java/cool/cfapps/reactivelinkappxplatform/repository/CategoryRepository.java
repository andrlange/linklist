package cool.cfapps.reactivelinkappxplatform.repository;

import cool.cfapps.reactivelinkappxplatform.entity.CategoryEntity;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import reactor.core.publisher.Flux;

public interface CategoryRepository extends ReactiveCrudRepository<CategoryEntity, Long> {
    Flux<CategoryEntity> findByTitleIgnoreCase(String title);
}
