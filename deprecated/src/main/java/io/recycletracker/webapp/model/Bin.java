package io.recycletracker.webapp.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import java.util.Date;
/**
 * User: alexthornburg
 * Date: 3/12/14
 * Time: 9:51 PM
 */

@Document
public class Bin {

    @Id
    private String id;
    @DBRef
    private WasteType wasteType = new WasteType();
    private double weight;
    private Date date;
    String facility;
    String unit;
    int suiteNumber;

    public String getId(){
        return id;
    }

    public void setId(String id){
        this.id = id;
    }

    public WasteType getWasteType(){
        return wasteType;
    }

    public void setWasteType(WasteType wasteType){
        this.wasteType = wasteType;
    }

    public int getSuiteNumber(){
        return suiteNumber;
    }

    public void setSuiteNumber(int suiteNumber){
        this.suiteNumber = suiteNumber;
    }


    public double getWeight(){
        return weight;
    }

    public void setWeight(double weight){
        this.weight = weight;
    }

    public Date getDate(){
        return date;
    }

    public void setDate(Date date){
        this.date = date;
    }

    public String getFacility(){
        return facility;
    }

    public void setFacility(String facility){
        this.facility = facility;
    }

    public void setUnit(String unit){
        this.unit = unit;
    }

    public String getUnit(){
        return unit;
    }

}
