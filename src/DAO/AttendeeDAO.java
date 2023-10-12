package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import VO.AttendeeVO;

public class AttendeeDAO implements EventInterface.AttendeeDAO {
    private Connection connection;

    public AttendeeDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void addAttendee(AttendeeVO attendee) {
        String sql = "INSERT INTO Attendee (AtndName, Email, Passwd, ExpoID) VALUES (?, ?, ?, ?)";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        	
            preparedStatement.setString(1, attendee.getAtndName());
            preparedStatement.setString(2, attendee.getEmail());
            preparedStatement.setString(3, attendee.getPasswd());
            preparedStatement.setInt(4, attendee.getExpoID());
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }

    @Override
    public List<AttendeeVO> getAllAttendees() {
    	
        List<AttendeeVO> attendees = new ArrayList<>();
        String sql = "SELECT * FROM Attendee";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
        		
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
            	
                AttendeeVO attendee = new AttendeeVO();
                attendee.setAtndID(resultSet.getInt("AtndID"));
                attendee.setAtndName(resultSet.getString("AtndName"));
                attendee.setEmail(resultSet.getString("Email"));
                attendee.setPasswd(resultSet.getString("Passwd"));
                attendee.setExpoID(resultSet.getInt("ExpoID"));
                
                attendees.add(attendee);
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
        return attendees;
        
    }

	@Override
	public AttendeeVO getAttendee(int attendeeId) {
		
		return null;
	}
    
    
}
