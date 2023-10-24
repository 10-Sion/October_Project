package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import VO.AttendeeVO;

public class AttendeeDAO implements EventInterface.AttendeeDAO {
    private Connection connection;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
    public AttendeeDAO() {
        // 데이터베이스 연결 초기화
        this.connection = DatabaseConnection.getConnection();
        
    }

    @Override
    public void addAttendee(AttendeeVO attendee) {
    	
        String sql = "INSERT INTO Attendee (AtndName, Email, Passwd, ExpoID, Status) VALUES (?, ?, SHA2(?, 256), ?, ?)";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        	
            preparedStatement.setString(1, attendee.getAtndName());
            preparedStatement.setString(2, attendee.getEmail());
            preparedStatement.setString(3, attendee.getPasswd());
            preparedStatement.setInt(4, attendee.getExpoID());
            preparedStatement.setInt(5, attendee.getStatus());
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
        	
            e.printStackTrace();
        }
    }
    
    // 소이 사용
    @Override
    public int addAttendee1(AttendeeVO attendee) {
        String insertSql = "INSERT INTO Attendee (AtndName, Email, Passwd, ExpoID, Status) VALUES (?, ?, SHA2(?, 256), ?, ?)";
        String selectSql = "SELECT AtndID FROM Attendee WHERE Email = ?";
        
        int AtndID = 0;
        
        try {
            // 새 참가자를 삽입합니다.
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) {
                preparedStatement.setString(1, attendee.getAtndName());
                preparedStatement.setString(2, attendee.getEmail());
                preparedStatement.setString(3, attendee.getPasswd());
                preparedStatement.setInt(4, attendee.getExpoID());
                preparedStatement.setInt(5, attendee.getStatus());
                
                int affectedRows = preparedStatement.executeUpdate();
                
                if (affectedRows == 0) {
                    throw new SQLException("참가자 생성 실패, 영향을 받는 행 없음.");
                }
                
                // 생성된 AtndID를 가져옵니다.
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        AtndID = generatedKeys.getInt(1);
                    } else {
                        throw new SQLException("참가자 생성 실패, ID를 가져오지 못함.");
                    }
                }
            }
            
            // 이메일을 사용하여 AtndID를 선택합니다.
            try (PreparedStatement selectStatement = connection.prepareStatement(selectSql)) {
                selectStatement.setString(1, attendee.getEmail());
                ResultSet rs = selectStatement.executeQuery();
                
                if (rs.next()) {
                    AtndID = rs.getInt("AtndID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return AtndID;
    }
    @Override
    public List<AttendeeVO> getAttendeeList(int status) {
        List<AttendeeVO> list = new ArrayList<>();
        String sql = "SELECT * FROM Attendee WHERE Status = ? ORDER BY AtndID ASC";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, status);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                AttendeeVO attendee = new AttendeeVO();
                attendee.setAtndID(rs.getInt("AtndID"));
                attendee.setAtndName(rs.getString("AtndName"));
                attendee.setEmail(rs.getString("Email"));
                attendee.setPasswd(rs.getString("Passwd"));
                attendee.setExpoID(rs.getInt("ExpoID"));
                attendee.setStatus(rs.getInt("Status"));
                list.add(attendee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    @Override
	public List<AttendeeVO> getAllAttendees() {
    	 List<AttendeeVO> list = new ArrayList<>();
         String sql = "SELECT * FROM Attendee";

         try (PreparedStatement pstmt = connection.prepareStatement(sql)) {


             ResultSet rs = pstmt.executeQuery();

             while (rs.next()) {
                 AttendeeVO attendee = new AttendeeVO();
                 attendee.setAtndID(rs.getInt("AtndID"));
                 attendee.setAtndName(rs.getString("AtndName"));
                 attendee.setEmail(rs.getString("Email"));
                 attendee.setPasswd(rs.getString("Passwd"));
                 attendee.setExpoID(rs.getInt("ExpoID"));
                 attendee.setStatus(rs.getInt("Status"));
                 list.add(attendee);
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }

         return list;
	}
    

    @Override
	public AttendeeVO getAttendee(String loginEmail) {
		
		String sql = "select * from Attendee WHERE Email = '" + loginEmail +"'" ;
		AttendeeVO attendee = null;
	    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	        
	        
	        rs = preparedStatement.executeQuery();
	       
	        if(rs.next()) {
	        	 attendee = new AttendeeVO();
	             attendee.setAtndID(rs.getInt("AtndID"));
	             attendee.setAtndName(rs.getString("AtndName"));
	             attendee.setEmail(rs.getString("Email"));
	             attendee.setPasswd(rs.getString("Passwd"));
	             attendee.setExpoID(rs.getInt("ExpoID"));
	             attendee.setStatus(rs.getInt("Status"));
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return attendee;
	}

	// 참가자 수락 메서드
    @Override
	public void acceptAllAttendees() {
	    String sql = "UPDATE Attendee SET Status = 1 WHERE Status = 0";

	    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	

	@Override
	public void UpdateAttendee() {
		// TODO Auto-generated method stub
		
	}

	// 소이 사용
	// 이메일로 참가자 조회 후 반환
	@Override
    public AttendeeVO getAttendeeByEmail(String email) {
        String sql = "SELECT * FROM Attendee WHERE Email = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                AttendeeVO attendee = new AttendeeVO();
                attendee.setAtndID(rs.getInt("AtndID"));
                attendee.setAtndName(rs.getString("AtndName"));
                attendee.setEmail(rs.getString("Email"));
                attendee.setExpoID(rs.getInt("ExpoID"));
                // 다른 필드도 설정

                return attendee;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // 해당 이메일로 참가자를 찾지 못한 경우
    }

	public String getExpoName(int ExpoID) {
		String sql = "select ExpoName from ExpoInfo where expoID = " + ExpoID;
		String ExpoName = "";
		try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
           

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                ExpoName = rs.getString("ExpoName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return ExpoName;
	}

	public int UpdateAttend(AttendeeVO vo) {
		String sql = "update Attendee set AtndName = ? , Email = ? where AtndID = ? ";
		int result = 0;
		
		try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
         pstmt.setString(1, vo.getAtndName());
         pstmt.setString(2, vo.getEmail());
         pstmt.setInt(3, vo.getAtndID());
			
         result = pstmt.executeUpdate();

          
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return result;
	}

	public int DelAttend(int atndID) {
		String sql = "delete from Attendee where atndID = " + atndID ;
		int result = 0;
		try {
			pstmt = connection.prepareStatement(sql);
			result = pstmt.executeUpdate();
			
			
			
		}catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
		return result;
	}

	public boolean CheckPass(String passwd, String loginEmail) {
		boolean result = false;
		String sql = "SELECT * FROM Attendee WHERE Email = ? AND Passwd = SHA2(?, 256)";   
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, loginEmail);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			
		}catch (Exception e) {
            e.printStackTrace();
        } finally {
        	try {
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
		return result;
	}


}
