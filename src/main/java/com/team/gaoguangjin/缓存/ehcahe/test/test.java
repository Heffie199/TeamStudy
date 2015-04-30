package com.team.gaoguangjin.缓存.ehcahe.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * <p>
 * User: Zhang Kaitao
 * <p>
 * Date: 14-1-1
 * <p>
 * Version: 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class test {
	
	@Autowired
	private UserService userService;// 这个对象需要注解
	
	@Autowired
	private CacheManager cacheManager;
	
	private Cache userCache;
	
	@Before
	public void setUp() {
		userCache = cacheManager.getCache("user");
	}
	
	@Test
	public void testCache() {
		Long id = 1L;
		// User user = new User(id, "zhang", "zhang@gmail.com");
		// userService.save(user);
		// Assert.assertNotNull(userCache.get(id).get());
		userService.findById(id);
		userService.findById(id);
	}
}