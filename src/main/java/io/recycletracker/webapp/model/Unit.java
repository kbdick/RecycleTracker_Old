package io.recycletracker.webapp.model;

/**
 * User: alexthornburg
 * Date: 2/20/14
 * Time: 11:49 AM
 */
import org.springframework.data.annotation.Id;
import java.util.List;
public class Unit {

    @Id
    String id;
    int floorBarcodeId;
    List<RecycleDay> recycleDays;

    public String getId(){
        return id;
    }

    public void setId(String id){
        this.id = id;
    }

    public int getFloorBarcodeId(){
        return floorBarcodeId;
    }

    public void setFloorBarcodeId(int floorBarcodeId){
        this.floorBarcodeId = floorBarcodeId;
    }

    public List<RecycleDay> getRecycleDays(){
        return recycleDays;
    }

    public void setRecycleDays(List<RecycleDay> recycleDays){
        this.recycleDays = recycleDays;
    }

}
