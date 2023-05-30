package cool.cfapps.reactivelinkappxplatform.repository;

import cool.cfapps.reactivelinkappxplatform.entity.LinkEntity;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import reactor.core.publisher.Flux;


public interface LinkRepository extends ReactiveCrudRepository<LinkEntity, Long> {
    Flux<LinkEntity> findByCategory(long id);
    Flux<LinkEntity> findByTitle(String title);
}
