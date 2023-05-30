package cool.cfapps.reactivelinkappxplatform.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LinkEntity {
    @Id
    private long id;
    private long category;
    private String title;
    private String url;
    private String description;
    private boolean support;
    private String contact;
    private String image;
    private int likes;
    private int dislikes;
    private boolean active;
}
