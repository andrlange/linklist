package cool.cfapps.reactivelinkappxplatform.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataIntegrityResponse {
    private int errorCode;
    private String message;
}
