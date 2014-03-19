package io.recycletracker.webapp.model;

/**
 * User: alexthornburg
 * Date: 2/20/14
 * Time: 11:44 AM
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.ArrayList;
import java.util.List;

@Document
public class Floor {

    @Id
    String id;
    String facilityName;
    int floorNumber;
    int barcodeId;

    @DBRef
    List<Unit> units = new ArrayList<Unit>();

    public String getFacilityName(){
        return facilityName;
    }

    public void setFacilityName(String facilityName){
        this.facilityName = facilityName;
    }

    public String getId(){
        return id;
    }

    public void setId(String id){
        this.id = id;
    }

    public int getFloorNumber(){
       return floorNumber;
    }

    public void setFloorNumber(int floorNumber){
        this.floorNumber = floorNumber;
    }

    public List<Unit> getUnits(){
        return units;
    }

    public void setUnits(List<Unit> units){
        this.units = units;
    }

    public void addUnit(Unit unit){
        this.units.add(unit);
    }

    public int getBarcodeId(){
        return barcodeId;
    }

    public void setBarcodeId(int barcodeId){
        this.barcodeId = barcodeId;
    }

}
