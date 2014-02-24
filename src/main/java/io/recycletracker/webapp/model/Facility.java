package io.recycletracker.webapp.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * User: alexthornburg
 * Date: 2/20/14
 * Time: 11:42 AM
 */
import java.util.List;

@Document
public class Facility {

    @Id
    String id;
    String name;
    String location;
    int barcodeId;
    List<Floor> floors;

    public String getId(){
        return id;
    }

    public void setId(String id){
        this.id = id;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getLocation(){
        return location;
    }

    public void setLocation(String location){
        this.location = location;
    }

    public int getBarcodeId(){
        return barcodeId;
    }

    public void setBarcodeId(int barcodeId){
        this.barcodeId = barcodeId;
    }

    public List<Floor> getFloors(){
        return this.floors;
    }

    public void setFloors(List<Floor> floors){
        this.floors = floors;
    }


}
