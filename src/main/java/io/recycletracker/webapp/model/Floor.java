package io.recycletracker.webapp.model;

/**
 * User: alexthornburg
 * Date: 2/20/14
 * Time: 11:44 AM
 */
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.util.List;

@Document
public class Floor {

    @Id
    String id;
    int facilityBarcodeId;
    int floorNumber;
    List<Unit> units;

    public String getId(){
        return id;
    }

    public void setId(String id){
        this.id = id;
    }

    public int getFacilityBarcodeId(){
        return facilityBarcodeId;
    }

    public void setFacilityBarcodeId(int facilityBarcodeId){
        this.facilityBarcodeId = facilityBarcodeId;
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

}
