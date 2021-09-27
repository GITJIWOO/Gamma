package org.game.gameinfo.mapper;

import org.game.gameinfo.domain.GameTagVO;
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
public class RequirementMapperTest {

	@Autowired
	private RequirementMapper mapper;
	
//	@Test
	public void testRequirementSelect() {
		log.info(mapper.selectRequirement(21L));
	}
	
//	@Test
	public void testRequirementInsert() {
		RequirementVO vo = new RequirementVO();
		vo.setGdirectx("Version 11");
		vo.setGgraphic("NVIDIA GeForce GTX 1060 3GB / AMD Radeon RX 580 4GB");
		vo.setGmemory(" 16 GB RAM");
		vo.setGos("64-bit Windows 7, Windows 8.1, Windows 10");
		vo.setGprocessor(" Intel Core i5-6600K / AMD Ryzen 5 1600");
		vo.setGstore("50 GB available space");
		vo.setGnum(1L);
		mapper.insertrequirement(vo);
	}
	
//	@Test
	public void testRequirementDelete() {
		mapper.deleteRequirement(46L);
	}
	
//	@Test
	public void testRequirementUpdate() {
		RequirementVO vo = new RequirementVO();
		vo.setGdirectx("DX11");
		vo.setGgraphic("NVidia: GeForce 560, AMD: Radeon HD 6950");
		vo.setGmemory(" 4GB");
		vo.setGos("64-bit Windows 7, Windows 8.1 / Windows 10");
		vo.setGprocessor(" Intel: Core i5-3300 / AMD: Ryzen 3 1200");
		vo.setGstore("SSD 16GB");
		vo.setGrnum(42L);
		
		mapper.updateRequirement(vo);
	}
}
