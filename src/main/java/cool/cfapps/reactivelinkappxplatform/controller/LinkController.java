package cool.cfapps.reactivelinkappxplatform.controller;

import cool.cfapps.reactivelinkappxplatform.dto.*;
import cool.cfapps.reactivelinkappxplatform.service.LinkService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
@Tag(name = "link-controller", description = "V1")
@RequestMapping("/api/v1/links")
public class LinkController {

    private final LinkService linkService;

    public LinkController(LinkService linkService) {
        this.linkService = linkService;
    }

    @GetMapping("")
    public Flux<LinkDto> getAll(){
        return linkService.findAll();
    }

    @PostMapping()
    public Mono<ResponseEntity<LinkDto>> create(@RequestBody Mono<CreateLinkDto> dto) {
        return linkService.createLink(dto)
                .map(ResponseEntity::ok)
                .defaultIfEmpty(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    Mono<ResponseEntity<LinkDto>> update(@PathVariable long id, @RequestBody Mono<UpdateLinkDto> dto) {
        return linkService.updateLink(id, dto)
                .map(ResponseEntity::ok)
                .defaultIfEmpty(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    Mono<Void> delete(@PathVariable long id) {
        return linkService.deleteLink(id);
    }

    @GetMapping("/byId/{id}")
    public Mono<ResponseEntity<LinkDto>> getById(@PathVariable long id) {
        return linkService.getLinkById(id)
                .map(ResponseEntity::ok)
                .defaultIfEmpty(ResponseEntity.notFound().build());
    }

    @GetMapping("/byCategory/{id}")
    public Flux<LinkDto> getByCategory(@PathVariable long id) {
        return linkService.getLinksByCategory(id);
    }

    @GetMapping("/byTitle/{title}")
    public Flux<LinkDto> getByCategory(@PathVariable String title) {
        return linkService.getLinksByTitle(title);
    }
}
