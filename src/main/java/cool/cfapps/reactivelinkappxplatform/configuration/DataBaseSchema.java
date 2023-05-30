package cool.cfapps.reactivelinkappxplatform.configuration;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Configuration;

@Configuration
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataBaseSchema {
    private String schema;
    private String user;

    public boolean isDefault(){
        return schema != null && schema.equals("public");
    }

    public String getUser(){
        return user!=null ? user : "postgres";
    }
}
