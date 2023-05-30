package cool.cfapps.reactivelinkappxplatform.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LinkDto {
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
    private String categoryTitle;
}
