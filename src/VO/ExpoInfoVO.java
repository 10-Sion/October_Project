package VO;

import java.util.Date;

public class ExpoInfoVO {
    private int expoID;
    private String expoName;
    private Date expoStartSched;
    private Date expoEndSched;
    private String organizer;
    private String description;


    // Getter 및 Setter
    public int getExpoID() {
        return expoID;
        
    }

    public void setExpoID(int expoID) {
        this.expoID = expoID;
        
    }

    public String getExpoName() {
        return expoName;
        
    }

    public void setExpoName(String expoName) {
        this.expoName = expoName;
        
    }

    public Date getExpoStartSched() {
        return expoStartSched;
        
    }

    public void setExpoStartSched(Date expoStartSched) {
        this.expoStartSched = expoStartSched;
        
    }

    public Date getExpoEndSched() {
        return expoEndSched;
        
    }

    public void setExpoEndSched(Date expoEndSched) {
        this.expoEndSched = expoEndSched;
        
    }

    public String getOrganizer() {
        return organizer;
        
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
        
    }

    public String getDescription() {
        return description;
        
    }

    public void setDescription(String description) {
        this.description = description;
        
    }
}
