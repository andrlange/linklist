package cool.cfapps.reactivelinkappxplatform.configuration;

import io.r2dbc.spi.ConnectionFactories;
import io.r2dbc.spi.ConnectionFactory;
import io.r2dbc.spi.ConnectionFactoryOptions;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.HashMap;
import java.util.Map;

import static io.r2dbc.postgresql.PostgresqlConnectionFactoryProvider.OPTIONS;
import static io.r2dbc.postgresql.PostgresqlConnectionFactoryProvider.SCHEMA;
import static io.r2dbc.spi.ConnectionFactoryOptions.*;


@Configuration
@Slf4j
public class DataBaseConfiguration {

    @Value("${spring.r2dbc.url:@null}")
    private String url;

    @Value("${spring.r2dbc.username:@null}")
    private String username;

    @Value("${spring.r2dbc.password:@null}")
    private String password;

    @Value("${spring.r2dbc.database:@null}")
    private String database;

    @Value("${spring.r2dbc.schema:public}")
    private String schema;
    @Value("${spring.r2dbc.host:@null}")
    private String host;

    @Value("${spring.r2dbc.port:0}")
    private int port;

    private final DataBaseSchema dataBaseSchema;

    public DataBaseConfiguration(DataBaseSchema dataBaseSchema) {
        this.dataBaseSchema = dataBaseSchema;
    }

    @Bean
    ConnectionFactory connectionFactory() {
        dataBaseSchema.setSchema(schema);
        dataBaseSchema.setUser(username);

        if (url != null) {
            Map<String, String> map = extractUserSchema(url);
            if(!map.isEmpty()) {
                String user = map.keySet().iterator().next();
                String schema = map.get(user);
                dataBaseSchema.setUser(user);
                dataBaseSchema.setSchema(schema);
                log.info("Schema from uri set to (user:schema) {}:{}", user,schema);
            } else {
                log.info("Schema from uri set to (user:schema) postgres:public)");
            }
            return ConnectionFactories.get(url);
        }

        Map<String, String> options = new HashMap<>();
        options.put("lock_timeout", "10s");
        options.put("statement_timeout", "300s");
        log.info("Schema from params set to {}", dataBaseSchema.getSchema());
        return ConnectionFactories.get(ConnectionFactoryOptions.builder()

                .option(DRIVER, "postgresql")
                .option(HOST, host == null ? "localhost" : host)
                .option(PORT, port == 0 ? 5432 : port)  // optional, defaults to 5432
                .option(USER, username == null ? "postgres" : username)
                .option(PASSWORD, password == null ? "postgres" : password)
                .option(DATABASE, database == null ? "postgres" : database)
                .option(SCHEMA, schema)
                .option(OPTIONS, options)// optional
                .build());
    }

    private Map<String, String> extractUserSchema(String url) {
        String u = url.replace("r2dbc:postgresql://", "http://");
        String user = "postgres";


        UriComponents uriComponents = UriComponentsBuilder.fromUriString(u).build();
        String s = uriComponents.getQueryParams().getFirst("schema");
        String[] userComponents = uriComponents.getUserInfo().split(":");
        if (userComponents.length > 0) {
            user = userComponents[0];
        }

        HashMap<String, String> map = new HashMap<>();
        if (s == null) s = "public";
        map.put(user, s);
        return map;
    }
}

