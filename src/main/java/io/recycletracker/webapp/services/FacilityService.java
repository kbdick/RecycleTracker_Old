package io.recycletracker.webapp.services;

import io.recycletracker.webapp.model.*;
import io.recycletracker.webapp.repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import java.util.List;
/**
 * User: alexthornburg
 * Date: 3/12/14
 * Time: 10:35 PM
 */
@Service
public class FacilityService {

    @Autowired
    private FacilityRepo facilityRepo;

    @Autowired
    private FloorRepo floorRepo;

    @Autowired
    private UnitRepo unitRepo;

    @Autowired
    private BinRepo binRepo;

    @Autowired
    private WasteTypeRepo wasteTypeRepo;

    public boolean create(Facility facility) {

        // duplicate username
        if (facilityRepo.findByName(facility.getName())!=null) {
            return false;
        }
        facilityRepo.updateFacility(facility);
        return true;
    }

    public void save(Facility facility) {
        facilityRepo.updateFacility(facility);
    }


    public void delete(Facility facility) {
        Assert.notNull(facility.getId());
        facilityRepo.deleteFacility(facility);
    }

    public Facility getByName(String name) {
        return facilityRepo.findByName(name);
    }

    public void saveFloor(Floor floor){
        floorRepo.updateFloor(floor);
    }

    public Floor getFloorByNumber(int floorNumber,String facilityName) {
        return floorRepo.findByName(floorNumber, facilityName);
    }

    public List<Facility> getAllFacilities() {
        return facilityRepo.listFacilities();
    }

    public List<Floor> getAllFloors(){
        return floorRepo.listFloors();
    }

    public void deleteFloor(Floor floor){
        floorRepo.delete(floor);
    }

    public void addFloor(Floor floor){
        floorRepo.addFloor(floor);
    }

    public void addUnit(Unit unit){
        unitRepo.addUnit(unit);
    }

    public void saveUnit(Unit unit){
        unitRepo.updateUnit(unit);
    }

    public void deleteUnit(Unit unit){
        unitRepo.deleteUnit(unit);
    }

    public Unit getUnitByName(String facilityName,int suiteNumber){
        return unitRepo.getUnitByName(facilityName,suiteNumber);
    }

    public WasteType getWasteType(String name){
        return wasteTypeRepo.findByName(name);
    }

    public List<WasteType> listWasteTypes(){
        return wasteTypeRepo.listWasteTypes();
    }

    public void addWasteType(WasteType wasteType){
        wasteTypeRepo.addWasteType(wasteType);
    }

    public void addBin(Bin bin){
        binRepo.addBin(bin);
    }

    public List<Bin> getBinsFromFacility(String facilityName){
        return binRepo.getBinByFacility(facilityName);

    }

}
