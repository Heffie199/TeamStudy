package com.team.gaoguangjin.缓存.ehcahe;

import lombok.extern.slf4j.Slf4j;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.junit.Test;

/**
 * @ClassName:TestEhcache.java
 * @Description:
 * @author gaoguangjin
 * @Date 2015-4-27 下午3:24:51
 */
@Slf4j
public class TestEhcache {
	
	public static void main(String[] args) {
		
		getCache();
	}
	
	/**
	 * @Description:先用junit 在磁盘缓存文件。然后启用main方法查询缓存
	 * @return:void
	 */
	public static void getCache() {
		CacheManager cachManager = CacheManager.create(TestEhcache.class.getClassLoader().getResourceAsStream(
				"com/team/gaoguangjin/缓存/ehcahe/ehcache.xml"));
		Cache cachteTest = cachManager.getCache("test");
		Element value = cachteTest.get("name2");// diskPersistent为true，否则重启服务后缓存文件会被清理掉
		log.info("" + value.getValue());
		
		// // 得到缓存中的对象数
		// log.info("" + cachteTest.getSize());
		// // 得到缓存对象占用内存的大小
		// log.info("" + cachteTest.getMemoryStoreSize());
		// // 得到缓存读取的命中次数
		// log.info("" + cachteTest.getStatistics().getLocalDiskSize());
		// // 得到缓存读取的错失次数
		// log.info("" + cachteTest.getStatistics().getLocalHeapSize());
		
	}
	
	/**
	 * @Description: 创建cache
	 */
	@Test
	public void create() {
		System.setProperty("net.sf.ehcache.enableShutdownHook", "true");
		CacheManager cachManager = CacheManager.create(TestEhcache.class.getClassLoader().getResourceAsStream(
				"com/team/gaoguangjin/缓存/ehcahe/ehcache.xml"));
		// CacheManager cachManager = CacheManager.create();//必须在classpath目录下面放ehcache.xml
		Cache cachteTest = cachManager.getCache("test");// 获取配置的cache实例
		Element element = new Element("name1", "gao");
		Element element2 = new Element("name2", "guang");
		cachteTest.put(element);
		cachteTest.put(element2);
		
		// cachManager.shutdown();
	}
	
}
