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
    
public int addAttendee1(AttendeeVO attendee) {
    	
        String sql = "INSERT INTO Attendee (AtndName, Email, Passwd, ExpoID, Status) VALUES (?, ?, SHA2(?, 256), ?, ?)";
        int AtndID= 0;
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        	
        	String email = attendee.getEmail();
            preparedStatement.setString(1, attendee.getAtndName());
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, attendee.getPasswd());
            preparedStatement.setInt(4, attendee.getExpoID());
            preparedStatement.setInt(5, attendee.getStatus());
            
            preparedStatement.executeUpdate();
            
            sql = "select AtndID from Attendee where email = "+ email;
            pstmt = connection.prepareStatement(sql);
            rs =  preparedStatement.executeQuery();
            
            if(rs.next()) {
            	AtndID = rs.getInt("AtndID");
            	
            }
        } catch (SQLException e) {
        	
            e.printStackTrace();
        }
        return AtndID;
    }

    @Override
    public List<AttendeeVO> getAllAttendees() {
        List<AttendeeVO> list = new ArrayList<>();

        //	수정 대기 중인 리스트만 가져옴
        String sql = "SELECT AtndID, AtndName, Email, ExpoID, Status FROM Attendee WHERE Status <> 1 ORDER BY AtndID DESC";

        try (PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                AttendeeVO attendee = new AttendeeVO();

                attendee.setAtndID(rs.getInt("AtndID"));
                attendee.setAtndName(rs.getString("AtndName"));
                attendee.setEmail(rs.getString("Email"));
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
    public AttendeeVO getAttendee(int attendeeId) {
        
        return null;
    }
}
