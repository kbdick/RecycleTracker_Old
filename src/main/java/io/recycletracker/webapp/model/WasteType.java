package io.recycletracker.webapp.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * User: alexthornburg
 * Date: 3/12/14
 * Time: 9:41 PM
 */
@Document
public class WasteType {

    @Id
    String id;
    String name;
    int barcodeId;
    boolean isRecyclable;

    public String getId(){
        return id;
    }

    public void setId(String id){
        this.id = id;
    }

    public boolean getIsRecyclable(){
        return isRecyclable;
    }

    public void setIsRecyclable(boolean isRecyclable){
        this.isRecyclable = isRecyclable;
    }

    public String name(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public int getBarcodeId(){
        return barcodeId;
    }

    public void setBarcodeId(int barcodeId){
        this.barcodeId = barcodeId;
    }
}
