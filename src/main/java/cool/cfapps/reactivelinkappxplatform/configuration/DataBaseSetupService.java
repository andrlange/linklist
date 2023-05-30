package cool.cfapps.reactivelinkappxplatform.configuration;

import cool.cfapps.reactivelinkappxplatform.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.io.Resource;
import org.springframework.data.r2dbc.core.R2dbcEntityTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StreamUtils;

import java.nio.charset.StandardCharsets;

@Service
@Slf4j
class DataSetupService implements CommandLineRunner {

    @Value("classpath:postgres/init.sql")
    private Resource initSql;

    private final R2dbcEntityTemplate template;

    private final CategoryService service;

    public DataSetupService(R2dbcEntityTemplate template, CategoryService service) {
        this.template = template;
        this.service = service;
    }

    @Override
    public void run(String... args) throws Exception {

        log.info("Checking if the database is empty...");
        try {
            if (Boolean.TRUE.equals(service.hasCategories().block())) {
                log.info("The database is not empty.");
                return;
            }
        } catch (Exception e) {
            log.info("Error accessing the database schema: {}", e.getMessage());
        }
        log.info("The database is empty. Creating the database...");


        String query =
                StreamUtils.copyToString(initSql.getInputStream(), StandardCharsets.UTF_8);

        log.info("Executing SQL: {}", query);

        template
                .getDatabaseClient()
                .sql(query)
                .then()
                .subscribe();
    }
}


