package com.team.gaoguangjin.设计模式.工厂模式.简单工厂模式;

/**
 * @author:gaoguangjin
 * @date 2016/5/6 9:42
 */
public class OraclJDBC  implements  JDBC{
    @Override
    public void connection() {
        System.out.println("OraclJDBC connection");
    }
}
