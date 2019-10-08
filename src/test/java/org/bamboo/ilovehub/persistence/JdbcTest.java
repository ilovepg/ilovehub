package org.bamboo.ilovehub.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class JdbcTest {
	private static final String DRIVER="org.mariadb.jdbc.Driver";
	//private static final String URL = "jdbc:mysql://localhost:3306/book_ex?useSSL=false";
	private static final String URL = "jdbc:mysql://218.149.135.58:3306/test?useSSL=false";
	private static final String USER = "root";
	private static final String PW = "akfldkelql!";
	
	@Test
	public void testConnection() throws ClassNotFoundException {
		Class.forName(DRIVER);
		try (Connection con = DriverManager.getConnection(URL,USER,PW)){
			System.out.println("con:"+con);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
