package cool.cfapps.reactivelinkappxplatform.configuration;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.info.License;
import io.swagger.v3.oas.annotations.servers.Server;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMapping;

@OpenAPIDefinition(servers = {
        @Server(url = "http://localhost:8080", description = "localhost dev"),
        @Server(url = "https://linklist.cfapps.cool", description = "prod environment")},
        info = @Info(
                title = "LinkList Service",
                version = "1.0",
                description = "LinkList Service API to serve links and categories",
        contact = @Contact(name = "Andreas Lange", email = "andreas@cfapps.cool"),
        license = @License(name = "MIT License", url = "<https://opensource.org/license/mit/>")))

@RequestMapping("/api/v1")
@Configuration
public class OpenApiConfiguration {
}
