package io.recycletracker.webapp.model;

/**
 * User: alexthornburg
 * Date: 1/27/14
 * Time: 9:12 PM
 */
public class RecycleWeight {
    String date;
    double weight;

    public RecycleWeight(){}

    public String geDate(){return date;}

    public void setDate(String date){this.date = date;}

    public double getWeight(){return weight;}

    public void setWeight(double weight){this.weight = weight;}


}
