package cool.cfapps.reactivelinkappxplatform.controller;

import cool.cfapps.reactivelinkappxplatform.dto.CategoryDto;
import cool.cfapps.reactivelinkappxplatform.dto.CreateCategoryDto;
import cool.cfapps.reactivelinkappxplatform.service.CategoryService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.headers.Header;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/api/v1/categories")
@Tag(name = "category-controller", description = "V1")
public class CategoryController {

    private final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }


    @Operation(
            summary = "Retrieves all categories",
            description = "Retrieves all categories"
    )
    @ApiResponses(
            {
                    @ApiResponse(
                            responseCode = "200",
                            description = "List of categories",
                            headers = {
                                    @Header(name = "content-type", schema = @Schema(type = "application/json"),
                                            description = "The content type of the response"),
                                    @Header(name = "transfer-encoding", schema = @Schema(type = "chunked"),
                                            description = "indicates that the response is chunked")},
                            content = @Content(
                                    mediaType = MediaType.TEXT_EVENT_STREAM_VALUE,
                                    schema = @Schema(implementation = CategoryDto.class),
                                    examples = {
                                            @ExampleObject(
                                                    name = "Success",
                                                    value = """
                                                            [
                                                                {
                                                                    "id": "1",
                                                                    "title": "General"
                                                                },
                                                                {
                                                                    "id": "2",
                                                                    "title": "Version Control"
                                                                },
                                                                {
                                                                    "id": "3",
                                                                    "title": "Languages and Frameworks"
                                                                }
                                                            ]""")
                                    }
                            )
                    )
            }
    )
    @GetMapping()
    public Flux<CategoryDto> getAll() {
        return categoryService.findAll();
    }


    @Operation(
            summary = "Retrieves a category by id",
            description = "Retrieves a category by id",
            parameters = {
                    @Parameter(
                            name = "id",
                            description = "The category id",
                            required = true,
                            example = "2")
            }
    )
    @ApiResponses(
            {
                    @ApiResponse(
                            responseCode = "200",
                            description = "Success",
                            headers = {@Header(name = "content-length", schema = @Schema(type = "integer"),
                                    description = "The content length of the response"),
                                    @Header(name = "content-type", schema = @Schema(type = "application/json"),
                                            description = "The content type of the response")
                            },
                            content = @Content(
                                    mediaType = MediaType.APPLICATION_JSON_VALUE,
                                    schema = @Schema(implementation = CategoryDto.class),
                                    examples = {
                                            @ExampleObject(
                                                    name = "selected category",
                                                    value = """
                                                            {
                                                              "id": "2",
                                                              "title": "Version Control"
                                                            }""")
                                    }
                            )
                    ),
                    @ApiResponse(
                            responseCode = "404",
                            description = "Error: Not Found",
                            headers = {@Header(name = "content-length", schema = @Schema(type = "integer"),
                                    description = "On Error: The content length is 0")},
                            content = @Content()
                    )
            }
    )
    @GetMapping("/byId/{id}")
    public Mono<ResponseEntity<CategoryDto>> getById(@PathVariable long id) {
        return categoryService.getCategoryByIdFromCache(id)
                .map(ResponseEntity::ok)
                .defaultIfEmpty(ResponseEntity.notFound().build());
    }


    @Operation(
            summary = "Retrieves a category by title",
            description = "Retrieves a category by title",
            parameters = {
                    @Parameter(
                            name = "title",
                            description = "The category title",
                            required = true,
                            example = "General")
            }
    )
    @ApiResponses(
            {
                    @ApiResponse(
                            responseCode = "200",
                            description = "Success",
                            headers = {@Header(name = "content-length", schema = @Schema(type = "integer"),
                                    description = "The content length of the response"),
                                    @Header(name = "content-type", schema = @Schema(type = "application/json"),
                                            description = "The content type of the response")
                            },
                            content = @Content(
                                    mediaType = MediaType.APPLICATION_JSON_VALUE,
                                    schema = @Schema(implementation = CategoryDto.class),
                                    examples = {
                                            @ExampleObject(
                                                    name = "selected category",
                                                    value = """
                                                            [{
                                                              "id": "1",
                                                              "title": "General"
                                                            }]""")
                                    }
                            )
                    ),
                    @ApiResponse(
                            responseCode = "404",
                            description = "Error: Not Found",
                            headers = {@Header(name = "content-length", schema = @Schema(type = "integer"),
                                    description = "On Error: The content length is 0")},
                            content = @Content()
                    )
            }
    )
    @GetMapping("/byTitle/{title}")
    public Flux<CategoryDto> getByTitle(@PathVariable String title) {
        return categoryService
                .getCategoryByName(title);
    }

    @Operation(
            summary = "Delete a category by id",
            description = "Delete a category by id if it is empty",
            parameters = {
                    @Parameter(
                            name = "id",
                            description = "The category id",
                            required = true,
                            example = "2")
            }
    )
    @DeleteMapping("/{id}")
    Mono<Void> delete(@PathVariable long id) {
        return categoryService.deleteCategory(id);
    }

    @Operation(
            summary = "Creates a category with a given title",
            description = "Updates a category by id and its new title",
            requestBody = @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    content = @Content(
                            mediaType = MediaType.APPLICATION_JSON_VALUE,
                            schema = @Schema(implementation = CreateCategoryDto.class),
                            examples = {
                                    @ExampleObject(
                                            name = "selected category",
                                            value = """
                                                    {
                                                      "title": "CI/CD Tools"
                                                    }""")
                            }

                    )
            )
    )
    @ApiResponses(
            {
                    @ApiResponse(
                            responseCode = "200",
                            description = "Success",
                            headers = {@Header(name = "content-length", schema = @Schema(type = "integer"),
                                    description = "The content length of the response"),
                                    @Header(name = "content-type", schema = @Schema(type = "application/json"),
                                            description = "The content type of the response")
                            },
                            content = @Content(
                                    mediaType = MediaType.APPLICATION_JSON_VALUE,
                                    schema = @Schema(implementation = CategoryDto.class),
                                    examples = {
                                            @ExampleObject(
                                                    name = "selected category",
                                                    value = """
                                                            {
                                                              "id": "5",
                                                              "title": "CI/CD Tools"
                                                            }""")
                                    }
                            )
                    )
            }
    )

    @PostMapping()
    public Mono<ResponseEntity<CategoryDto>> create(@RequestBody Mono<CreateCategoryDto> dto) {
        return categoryService.createCategory(dto)
                .map(ResponseEntity::ok)
                .defaultIfEmpty(ResponseEntity.notFound().build());
    }

    @Operation(
            summary = "Updates a category by id and its new title",
            description = "Updates a category by id and its new title",
            parameters = {
                    @Parameter(
                            name = "id",
                            description = "The category id",
                            required = true,
                            example = "2")
            },
            requestBody = @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    content = @Content(
                            mediaType = MediaType.APPLICATION_JSON_VALUE,
                            schema = @Schema(implementation = CategoryDto.class),
                            examples = {
                                    @ExampleObject(
                                            name = "selected category",
                                            value = """
                                                    {
                                                      "id": "2",
                                                      "title": "Version Controls"
                                                    }""")
                            }

                    )
            )
    )
    @ApiResponses(
            {
                    @ApiResponse(
                            responseCode = "200",
                            description = "Success",
                            headers = {@Header(name = "content-length", schema = @Schema(type = "integer"),
                                    description = "The content length of the response"),
                                    @Header(name = "content-type", schema = @Schema(type = "application/json"),
                                            description = "The content type of the response")
                            },
                            content = @Content(
                                    mediaType = MediaType.APPLICATION_JSON_VALUE,
                                    schema = @Schema(implementation = CategoryDto.class),
                                    examples = {
                                            @ExampleObject(
                                                    name = "selected category",
                                                    value = """
                                                            {
                                                              "id": "2",
                                                              "title": "Version Controls"
                                                            }""")
                                    }
                            )
                    ),
                    @ApiResponse(
                            responseCode = "404",
                            description = "Error: Not Found",
                            headers = {@Header(name = "content-length", schema = @Schema(type = "integer"),
                                    description = "On Error: The content length is 0")},
                            content = @Content()
                    )
            }
    )
    @PutMapping("/{id}")
    Mono<ResponseEntity<CategoryDto>> update(@PathVariable long id, @RequestBody Mono<CategoryDto> dto) {
        return categoryService.updateCategory(id, dto)
                .map(ResponseEntity::ok)
                .defaultIfEmpty(ResponseEntity.notFound().build());
    }


    @GetMapping("/cached")
    public Flux<CategoryDto> getAllFromCache() {
        return categoryService.getAllFromCache();
    }
}
