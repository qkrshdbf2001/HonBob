package egovframework.example.cmmn.customtag;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.InitializingBean;

import egovframework.example.cmmn.customtag.groupcode.GroupCodeHandler;

/**
 * 
 * tag 관련 Data와 Handler를 생성하기 위한 Factory Class
 *
 */
public class TagFactory implements InitializingBean {
	
	@Override
	public void afterPropertiesSet() throws Exception {
		
		GroupCodeHandler.createInstance(this.sqlSession);
	}
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
