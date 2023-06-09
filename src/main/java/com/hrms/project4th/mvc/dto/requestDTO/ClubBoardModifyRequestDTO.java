package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class ClubBoardModifyRequestDTO {

    private Long cbNo;
    private String cbTitle;
    private String cbContent;
    private MultipartFile cbURL;

}
