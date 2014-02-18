package io.recycletracker.webapp.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;


@Document
public class RecycleDay {

    @Id
    String id;
    Date date;
    double wetTrash;
    double recyclingData;
    double diversion1;
    double diversion2;
    double metal;
    double flourescent;
    double incandescent;
    double batteries;
    double electronics;
    double ballasts;
    double compostTons;
    double openTop;
    String building;

    public String getId(){
        return id;
    }

    public void setId(String id){
        this.id = id;
    }

    public Date getDate(){
        return date;
    }

    public void setDate(Date date){
        this.date = date;
    }

    public double getWetTrash(){
        return wetTrash;
    }

    public void setWetTrash(double wetTrash){
        this.wetTrash = wetTrash;
    }

    public double getRecyclingData(){
        return recyclingData;
    }

    public void setRecyclingData(double recyclingData){
        this.recyclingData = recyclingData;
    }

    public double getDiversion1(){
        return diversion1;
    }

    public void setDiversion1(double diversion1){
        this.diversion1 = diversion1;
    }

    public double getDiversion2(){
        return diversion2;
    }

    public void setDiversion2(double diversion2){
        this.diversion2 = diversion2;
    }

    public double getMetal(){
        return metal;
    }

    public void setMetal(double metal){
        this.metal = metal;
    }

    public double getFlourescent(){
        return flourescent;
    }

    public void setFlourescent(double flourescent){
        this.flourescent = flourescent;
    }

    public double getIncandescent(){
        return incandescent;
    }

    public void setIncandescent(double incan){
        this.incandescent = incan;
    }

    public double getBatteries(){
        return batteries;
    }

    public void setBatteries(double batteries){
        this.batteries = batteries;
    }

    public double getElectronics(){
        return electronics;
    }

    public void setElectronics(double electronics){
        this.electronics = electronics;
    }

    public double getBallasts(){
        return ballasts;
    }

    public void setBallasts(double ballasts){
        this.ballasts = ballasts;
    }

    public double getCompostTons(){
        return compostTons;
    }

    public void setCompostTons(double compostTons){
        this.compostTons = compostTons;
    }

    public double getOpenTop(){
        return openTop;
    }

    public void setOpenTop(double openTop){
        this.openTop = openTop;
    }

    public void setBuilding(String building){
        this.building = building;
    }

    public String getBuilding(){
        return building;
    }

    public double addTotal(){
        return getWetTrash() + getRecyclingData() + getOpenTop() +
               getMetal() + getFlourescent() + getBallasts() +
               getIncandescent()+ getElectronics() + getCompostTons() +
               getBatteries();
    }

    public double addRecycling(){
        return  getRecyclingData()* getDiversion1() +
                getOpenTop()*getDiversion2() +
                getMetal() + getFlourescent() +
                getBallasts() + getIncandescent() +
                getElectronics() + getCompostTons() +
                getBatteries();
    }


}
