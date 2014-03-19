package io.recycletracker.webapp.model;

/**
 * User: alexthornburg
 * Date: 2/20/14
 * Time: 11:49 AM
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.ArrayList;
import java.util.List;
@Document
public class Unit {

    @Id
    String id;
    String facilityName;
    String name;
    int floorNumber;
    int suiteNumber;
    int barcodeId;

    @DBRef
    List<Bin> bins = new ArrayList<Bin>();

    public String getId(){
        return id;
    }

    public void setId(String id){
        this.id = id;
    }

    public String getFacilityName(){
        return facilityName;
    }

    public void setFacilityName(String name){
        this.facilityName = name;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public int getFloorNumber(){
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber){
        this.floorNumber = floorNumber;
    }

    public int getSuiteNumber(){
        return suiteNumber;
    }

    public void setSuiteNumber(int suiteNumber){
        this.suiteNumber = suiteNumber;
    }

    public List<Bin> getBins(){
        return bins;
    }

    public void setBins(List<Bin> bins){
        this.bins = bins;
    }

    public void addBin(Bin bin){
        this.bins.add(bin);
    }

    public int getBarcodeId(){
        return barcodeId;
    }

    public void setBarcodeId(int facilityBarcodeId){
        this.barcodeId = barcodeId;
    }

}
