package io.recycletracker.webapp.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.ArrayList;
import java.util.List;

/**
 * User: alexthornburg
 * Date: 2/20/14
 * Time: 11:42 AM
 */

@Document
public class Facility {

    @Id
    String id;
    String name;
    String address;
    int barcodeId;
    String scrollbar;

    @DBRef
    List<Floor> floors = new ArrayList<Floor>();

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

    public String getAddress(){
        return address;
    }

    public void setAddress(String address){
        this.address = address;
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

    public void addFloor(Floor floor){
        this.floors.add(floor);
    }

    public String getScrollbar(){
        return scrollbar;
    }

    public void setScrollbar(String scrollbar){
        this.scrollbar = scrollbar;
    }

    public List<Bin> getAllBins(){
        List<Bin> list = new ArrayList<Bin>();
        for(Floor floor:floors){
            for(Unit unit:floor.getUnits()){
                for(Bin bin:unit.getBins()){
                    list.add(bin);
                }
            }
        }
        return list;
    }


}
