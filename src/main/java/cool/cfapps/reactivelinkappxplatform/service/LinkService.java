package cool.cfapps.reactivelinkappxplatform.service;

import cool.cfapps.reactivelinkappxplatform.dto.CategoryDto;
import cool.cfapps.reactivelinkappxplatform.dto.CreateLinkDto;
import cool.cfapps.reactivelinkappxplatform.dto.LinkDto;
import cool.cfapps.reactivelinkappxplatform.dto.UpdateLinkDto;
import cool.cfapps.reactivelinkappxplatform.repository.LinkRepository;
import cool.cfapps.reactivelinkappxplatform.util.EntityDtoUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Service
@Slf4j
public class LinkService {

    private final LinkRepository linkRepository;
    private final CategoryService categoryService;

    public LinkService(LinkRepository linkRepository, CategoryService categoryService) {
        this.linkRepository = linkRepository;
        this.categoryService = categoryService;
    }

    public Flux<LinkDto> findAll() {
        return linkRepository
                .findAll()
                .map(EntityDtoUtil::toDto)
                .map(dto -> {
                    dto.setCategoryTitle(categoryService.getCategoryTitleById(dto.getCategory()));
                    log.info("added category title:" + dto.getCategoryTitle());
                    return dto;
                });
    }

    public Mono<LinkDto> getLinkById(long id) {

        return linkRepository
                .findById(id)
                .map(EntityDtoUtil::toDto)
                .map(link -> {
                    link.setCategoryTitle(categoryService.getCategoryTitleById(link.getCategory()));
                    return link;
                });
    }

    public Flux<LinkDto> getLinksByCategory(long id) {
        return linkRepository
                .findByCategory(id)
                .map(EntityDtoUtil::toDto)
                .map(link -> {
                    link.setCategoryTitle(categoryService.getCategoryTitleById(link.getCategory()));
                    return link;
                });
    }

    public Flux<LinkDto> getLinksByTitle(String title) {
        return linkRepository
                .findByTitle(title)
                .map(EntityDtoUtil::toDto)
                .map(link -> {
                    link.setCategoryTitle(categoryService.getCategoryTitleById(link.getCategory()));
                    return link;
                });
    }

    public Mono<Void> deleteLink(long id) {
        return linkRepository.deleteById(id);
    }

    public Mono<Boolean> hasLinks() {
        try {
            return linkRepository.count().map(count -> count > 0);
        } catch (Exception e) {
            log.error("accessing schema linklist:" + e.getMessage());
            return Mono.just(false);
        }
    }

    public Mono<LinkDto> createLink(Mono<CreateLinkDto> dto) {
        return dto
                .map(EntityDtoUtil::toEntity)
                .flatMap(linkRepository::save)
                .map(EntityDtoUtil::toDto)
                .map(newLink -> {
                    newLink.setCategoryTitle(categoryService.getCategoryTitleById(newLink.getCategory()));
                    return newLink;
                });
    }


    public Mono<LinkDto> updateLink(long id, Mono<UpdateLinkDto> updateLinkDto) {
        return linkRepository.findById(id)
                .flatMap(entity -> updateLinkDto
                        .map(EntityDtoUtil::toEntity)
                        .doOnNext(link -> link.setId(id))
                        .flatMap(linkRepository::save)
                        .map(EntityDtoUtil::toDto))
                .map(newLink -> {
                    newLink.setCategoryTitle(categoryService.getCategoryTitleById(newLink.getCategory()));
                    return newLink;
                });
    }
}
