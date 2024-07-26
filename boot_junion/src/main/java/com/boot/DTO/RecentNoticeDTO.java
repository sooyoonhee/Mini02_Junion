package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecentNoticeDTO {
	private int noitice_num;
	private String user_email;
}
