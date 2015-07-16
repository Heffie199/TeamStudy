package com.team.gaoguangjin.alibaba.zookeper;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooDefs.Ids;
import org.apache.zookeeper.ZooKeeper;
import org.apache.zookeeper.data.Stat;

@Slf4j
public class ZookeperServer {
	static ZooKeeper zk;
	private static Stat stat = new Stat();
	
	public static void main(String[] args) throws InterruptedException, KeeperException {
		
		// 第一次调用，第二次注释
		test();
		zk.create("/serverroot", "serverroot".getBytes(), Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
		
		Thread.sleep(4000);
		System.out.println("第一次");
		addServerByName("server1");
		
		Thread.sleep(4000);
		System.out.println("第二次");
		addServerByName("server2");
		delete();
	}
	
	private static void test() {
		try {
			// 第二个参数为Session超时时间，第三个为节点变化时
			zk = new ZooKeeper("localhost:2181", 60000, new Watcher() {
				// 监控所有被触发的事件
				public void process(WatchedEvent event) {
				}
			});
		} catch (Exception e) {
			log.error("错误！" + e.getLocalizedMessage());
		}
	}
	
	private static void delete() throws KeeperException, InterruptedException {
		List<String> subList = zk.getChildren("/serverroot", false);
		for (String string : subList) {
			zk.delete("/serverroot/" + string, -1);
		}
		zk.delete("/serverroot", -1);
	}
	
	private static void addServerByName(String name) {
		try {
			zk.create("/serverroot/" + name, name.getBytes(), Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
		} catch (Exception e) {
			log.error("添加服务节点错误" + e.getLocalizedMessage());
		}
	}
	
}
