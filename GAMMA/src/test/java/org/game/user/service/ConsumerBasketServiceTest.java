package org.game.user.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ConsumerBasketServiceTest {
	
	@Autowired
	private ConsumerBasketService service;
	
	@Test
	public void getConsumerBasketListTest() {
		log.info(service.getConsumerBasketList("kjw011231"));
	}
	
	// @Test
	public void additionConsumerBasketTest() {
		service.additionConsumerBasket("kjw011231", 82L);
	}
	
	// @Test
	public void removeConsumerBasketTest() {
		service.removeConsumerBasket("kjw011231", 61L);
	}
	
}
