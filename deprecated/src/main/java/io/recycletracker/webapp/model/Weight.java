package io.recycletracker.webapp.model;
/**
 * User: alexthornburg
 * Date: 3/13/14
 * Time: 7:08 PM
 */
public class Weight {
    double landfill;
    double recycling;
    String date;

    public double getLandfill(){
        return landfill;
    }

    public void setLandfill(double landfill){
        this.landfill = landfill;
    }

    public double getRecycling(){
        return landfill;
    }

    public void setRecycling(double recycling){
        this.recycling = recycling;
    }

    public String getDate(){
        return date;
    }

    public void setDate(String date){
        this.date = date;
    }
}
