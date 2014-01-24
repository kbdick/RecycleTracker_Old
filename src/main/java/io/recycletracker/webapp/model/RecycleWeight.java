package io.recycletracker.webapp.model;

/**
 * User: alexthornburg
 * Date: 1/24/14
 * Time: 12:57 AM
 */
public class RecycleWeight {
    String date;
    double close;

    public RecycleWeight(){

    }

    public String getDate(){
        return date;
    }

    public void setDate(String date){
        this.date = date;
    }

    public double getClose(){
        return close;
    }

    public void setClose(double close){
        this.close = close;
    }
}
