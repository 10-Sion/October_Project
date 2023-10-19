package DAO;

import java.util.List;

import VO.AttendeeVO;
import VO.CompanyVO;

public interface EventInterface {
    void someMethod();

    interface CompanyDAO {	//	사전등록 기업 참가 DAO
    	void addCompany(CompanyVO company);
    	void acceptCompany(int companyId);
    }

    interface AttendeeDAO {	//	사전등록 참가자 DAO
        void addAttendee(AttendeeVO attendee);
        AttendeeVO getAttendee(int attendeeId);
        List<AttendeeVO> getAllAttendees();
        int addAttendee1(AttendeeVO attendee);
    }

}
