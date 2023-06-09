package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class MyBossRequestDTO {

    private long empNo;
    private String deptCode;
    private String posCode;

}
