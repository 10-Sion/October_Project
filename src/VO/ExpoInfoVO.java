package VO;

import java.util.Date;

public class ExpoInfoVO {
    private int expoID;
    private String expoName;
    private Date expoSched;
    private String location;
    private String description;


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

    public Date getExpoSched() {
        return expoSched;
        
    }

    public void setExpoSched(Date expoSched) {
        this.expoSched = expoSched;
        
    }

    public String getLocation() {
        return location;
        
    }

    public void setLocation(String location) {
        this.location = location;
        
    }

    public String getDescription() {
        return description;
        
    }

    public void setDescription(String description) {
        this.description = description;
        
    }
}
