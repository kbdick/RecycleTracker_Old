package io.recycletracker.webapp.model;

/**
 * User: alexthornburg
 * Date: 1/27/14
 * Time: 9:12 PM
 */
import java.util.Date;

public class RecycleWeight {
    Date date;
    double weight;

    public RecycleWeight(){}

    public Date getDate(){return date;}

    public void setDate(Date date){this.date = date;}

    public double getWeight(){return weight;}

    public void setWeight(double weight){this.weight = weight;}


}
