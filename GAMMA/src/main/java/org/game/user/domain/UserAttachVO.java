package org.game.user.domain;

import lombok.Data;

@Data
public class UserAttachVO {
		
		private String uuuid;
		private String uploadPath;
		private String fileName;
		private boolean image;
		
		private Long cnum;
}
