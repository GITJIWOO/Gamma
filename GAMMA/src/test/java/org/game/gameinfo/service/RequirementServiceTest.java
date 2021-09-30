package org.game.gameinfo.service;

import static org.junit.Assert.assertNotNull;

import org.game.gameinfo.domain.RequirementVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RequirementServiceTest {

	@Autowired
	private RequirementService service;
	
//	@Test
	public void testExist() {
		log.info("ㄱㄱㄱㄱㄱㄱㄱㄱㄱ: " + service);
		assertNotNull(service);
		
	}
//	@Test
	public void testRegister() {
		RequirementVO vo = new RequirementVO();
		vo.setGdirectx("dirextx10");
		vo.setGgraphic("NVIDIA GeForce 8800 GT");
		vo.setGmemory("4GB");
		vo.setGnum(25L);
		vo.setGos("Windows 10, macOS® 10.12");
		vo.setGprocessor("Intel Core 2 Duo E6600");
		vo.setGstore("8 GB 이상");
		service.registerRequirement(vo);
	}
	
//	@Test
	public void testSelect() {
		service.getRequirement(62L);
	}
	@Test 
	public void testDelete() {
		service.removeRequirement(85L);
	}
//	@Test
	public void testUpdate() {
		RequirementVO vo = new RequirementVO();
		vo.setGdirectx("xxxxxxxxx");
		vo.setGgraphic("xxxxxxxxxxxxxxx");
		vo.setGmemory("4GB");
		vo.setGos("Windows x");
		vo.setGprocessor("Intel Core x");
		vo.setGstore("8 xxx");
		vo.setGrnum(83L);
		service.modifyRequirement(vo);
	}
}
