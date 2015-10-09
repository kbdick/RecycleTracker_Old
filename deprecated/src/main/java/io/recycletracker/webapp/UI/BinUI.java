package io.recycletracker.webapp.UI;

/**
 * User: alexthornburg
 * Date: 3/14/14
 * Time: 1:18 AM
 */
public class BinUI {
    private String weight;
    private String date;
    String facility;
    String unit;
    int suiteNumber;
    private String wasteType;

    public String getWasteType(){
        return wasteType;
    }

    public void setWasteType(String wasteType){
        this.wasteType = wasteType;
    }

    public int getSuiteNumber(){
        return suiteNumber;
    }

    public void setSuiteNumber(int suiteNumber){
        this.suiteNumber = suiteNumber;
    }


    public String getWeight(){
        return weight;
    }

    public void setWeight(String weight){
        this.weight = weight;
    }

    public String getDate(){
        return date;
    }

    public void setDate(String date){
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
