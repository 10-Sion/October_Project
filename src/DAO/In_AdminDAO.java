package DAO;

// 소이 - 면접 관리자 정보를 데이터베이스와 연동하는 DAO 클래스

import VO.In_AdminVO; // 해당 VO 클래스를 임포트

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class In_AdminDAO {
	private Connection connection;

    public In_AdminDAO() {
    	this.connection = DatabaseConnection.getConnection();
    }

    

}
