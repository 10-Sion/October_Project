package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		// TODO Auto-generated method stub
		return null;
	}

	// 참가자 수락 메서드
	public void acceptAllAttendees() {
	    String sql = "UPDATE Attendee SET Status = 1 WHERE Status = 0";

	    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

}
