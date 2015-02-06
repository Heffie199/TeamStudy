package com.team.gaoguangjin.springinaction.test;

public class NaughtyWaiter implements Waiter {
	public void greetTo(String clientName) {
		System.out.println("NaughtyWaiter:greet to " + clientName + "...");
	}
	
	public void serveTo(String clientName) {
		System.out.println("NaughtyWaiter:serving " + clientName + "...");
	}
	
	public void joke(String clientName, int times) {
		System.out.println("NaughtyWaiter:play " + times + " jokes to " + clientName + "...");
	}
	
	public void smile(String clientName, int times) {
		// TODO Auto-generated method stub
		
	}
}