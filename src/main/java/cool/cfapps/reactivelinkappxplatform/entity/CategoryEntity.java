package cool.cfapps.reactivelinkappxplatform.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryEntity {
    @Id
    private long id;
    private String title;
}
