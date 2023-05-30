package cool.cfapps.reactivelinkappxplatform.exceptionhandler;

import cool.cfapps.reactivelinkappxplatform.dto.DataIntegrityResponse;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class IntegrityExceptionHandler {

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<DataIntegrityResponse> handleInputValidationException(DataIntegrityViolationException e) {
        DataIntegrityResponse response = new DataIntegrityResponse();
        response.setErrorCode(HttpStatus.METHOD_NOT_ALLOWED.value());
        response.setMessage("Categories can not be deleted as long it contains links. And Links can not be moved or " +
                            "created into non existing categories.");

        return ResponseEntity.status(response.getErrorCode()).body(response);
    }
}
