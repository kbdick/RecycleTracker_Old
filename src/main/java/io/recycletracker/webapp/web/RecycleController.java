package io.recycletracker.webapp.web;

import com.google.gson.Gson;
import io.recycletracker.webapp.UI.BinUI;
import io.recycletracker.webapp.UI.UserUI;
import io.recycletracker.webapp.model.*;
import io.recycletracker.webapp.services.FacilityService;
import io.recycletracker.webapp.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/")
public class RecycleController {

    @Autowired
    private FacilityService facilityService;

    @Autowired
    private UserService userService;


	@RequestMapping(method = RequestMethod.GET)
	public String printBuilding(final ModelMap model) {

        Calendar yesterday = Calendar.getInstance();
        Calendar today = Calendar.getInstance();
        if(facilityService.getByName("Merchandise Mart")!=null){

            Facility facility =  facilityService.getByName("Merchandise Mart");

            List<Bin> list = facilityService.getBinsFromFacility(facility.getName());
            Collections.sort(list, new Comparator<Bin>() {
                public int compare(Bin c1, Bin c2) {
                    return c2.getDate().compareTo(c1.getDate());
                }
            });
            Map<String,Double> recyclingWeights = new HashMap<String,Double>();
            Map<String,Double> landfillWeights = new HashMap<String,Double>();
            yesterday.add(Calendar.DATE, -1);
            System.out.println(yesterday.toString());
            int count = 0;
            if(list.size() != 0){
                for(Bin bin:list){
                   if(recyclingWeights.get(bin.getDate().toString())==null&&bin.getWasteType().getIsRecyclable()){
                       System.out.println("Empty");
                       recyclingWeights.put(bin.getDate().toString(),bin.getWeight());
                   }else if(recyclingWeights.get(bin.getDate().toString())!=null&&bin.getWasteType().getIsRecyclable()){
                        System.out.println("Already There");
                        double currentWeight = recyclingWeights.get(bin.getDate().toString());
                        double newWeight = currentWeight + bin.getWeight();
                        recyclingWeights.put(bin.getDate().toString(),newWeight);
                    }
                    if(landfillWeights.get(bin.getDate().toString())==null&&!bin.getWasteType().getIsRecyclable()){
                        System.out.println("Empty");
                        landfillWeights.put(bin.getDate().toString(),bin.getWeight());
                    }else if(landfillWeights.get(bin.getDate().toString())!=null&&bin.getWasteType().getIsRecyclable()){
                        System.out.println("Already There");
                        double currentWeight = landfillWeights.get(bin.getDate().toString());
                        double newWeight = currentWeight + bin.getWeight();
                        landfillWeights.put(bin.getDate().toString(),newWeight);
                    }
                }
            }
            List<Weight> finalList = new ArrayList<Weight>();
            for (Map.Entry<String, Double> entry : recyclingWeights.entrySet()){
                System.out.println(entry.getKey() + "/" + entry.getValue());
                Weight weight = new Weight();

                String [] dateSplit = entry.getKey().split(" ");
                weight.setDate(dateSplit[0]+" "+dateSplit[1]+" "+dateSplit[2]);
                weight.setRecycling(entry.getValue());
            }
            for (Map.Entry<String, Double> entry : landfillWeights.entrySet()){
                System.out.println(entry.getKey() + "/" + entry.getValue());
                Weight weight = new Weight();

                String [] dateSplit = entry.getKey().split(" ");
                weight.setDate(dateSplit[0]+" "+dateSplit[1]+" "+dateSplit[2]);
                weight.setLandfill(entry.getValue());
                finalList.add(weight);
            }
            today.set(Calendar.HOUR_OF_DAY, 0);
            today.set(Calendar.MINUTE, 0);
            today.set(Calendar.SECOND, 0);
            System.out.println(today.getTime());
            yesterday.set(Calendar.HOUR_OF_DAY, 0);
            yesterday.set(Calendar.MINUTE, 0);
            yesterday.set(Calendar.SECOND, 0);
            double recyclingToday =0;
            double landfillToday=0;
            if(recyclingWeights.get(today.getTime().toString())!=null){
            recyclingToday = recyclingWeights.get(today.getTime().toString());
            System.out.println(recyclingToday);
            landfillToday = landfillWeights.get(today.getTime().toString());
            }
            double recyclingYesterday =0;
            double landfillYesterday =0;
            if(recyclingWeights.get(today.getTime().toString())!=null){
                recyclingYesterday = recyclingWeights.get(yesterday.getTime().toString());
                landfillYesterday = landfillWeights.get(yesterday.getTime().toString());
            }
            double yesterdayPercentage = recyclingYesterday/(recyclingYesterday+landfillYesterday);
            double todayPercentage = recyclingToday/(recyclingToday+landfillToday);
            Gson gson = new Gson();
            double trend =  todayPercentage - yesterdayPercentage * 100;
            String upDown;
            if(trend<0){
                upDown = "down";
            }else{
                upDown = "up";
            }
            model.addAttribute("scrollBox",facility.getScrollbar());
            model.addAttribute("data",gson.toJson(finalList));
            model.addAttribute("date", Calendar.getInstance().getTime());
            model.addAttribute("trend", upDown);
            model.addAttribute("percentage",Math.round(todayPercentage));
            model.addAttribute("change",Math.round(trend));
        }else{
            model.addAttribute("scrollBox","Add a facility over there -->");
            model.addAttribute("data",0);
            model.addAttribute("date", "Enter some data over there --->");
            model.addAttribute("trend", "Enter some data");
            model.addAttribute("percentage",0);
            model.addAttribute("todayPercentage",0);
            model.addAttribute("flag","Enter Admin to Setup Facility, then add some bins! -->");
        }

		return "building";
	}
    @RequestMapping(value = "/day", method = RequestMethod.GET)
    public String getPersonList(ModelMap model) {
        model.addAttribute("recycleList", facilityService.getByName("Merchandise Mart").getAllBins());
        return "add-data";
    }

    @RequestMapping(value = "/day/add", method = RequestMethod.POST)
    public String createBin(@ModelAttribute BinUI bin, ModelMap model) {
        Bin bin1 = new Bin();
        try {
            Date date = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(bin.getDate());
            System.out.println(date.toString());
            bin1.setDate(date);
        } catch (ParseException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        bin1.setFacility(bin.getFacility());
        bin1.setSuiteNumber(bin.getSuiteNumber());
        bin1.setWasteType(facilityService.getWasteType(bin.getWasteType()));
        bin1.setWeight(Double.parseDouble(bin.getWeight()));
        Unit unit = facilityService.getUnitByName(bin.getFacility(),bin.getSuiteNumber());
        facilityService.addBin(bin1);
        unit.addBin(bin1);
        facilityService.saveUnit(unit);
        return "redirect:/day";
    }

    @RequestMapping(value = "/bin/delete", method = RequestMethod.GET)
    public String deleteBin(@ModelAttribute Bin bin, ModelMap model) {
        return "redirect:/day";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {
        return "login";
    }

    @RequestMapping(value = "/login/failure", method = RequestMethod.GET)
    public String loginFailed(ModelMap model) {
        return "login";
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logout(ModelMap model) {

        return "login";

    }

    @RequestMapping(value="/user/add", method = RequestMethod.GET)
    public String addUser(ModelMap model) {

        return "add-user";

    }

    @RequestMapping(value = "/user/add", method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute UserUI user, ModelMap model) {
        System.out.println("In add post method");
        String resultPage = "login";

        if (userService.getByUsername(user.getUsername()) != null) {
            resultPage = "redirect:/user/add";
        }
        User user1 = new User();
        user1.setFirstname(user.getFirstname());
        user1.setLastname(user.getLastname());
        user1.setUsername(user.getUsername());
        user1.setPassword(user.getPassword());
        user1.addRole(new Role(user.getRole()));

        boolean savedUser = userService.create(user1);
        if (savedUser) {
            resultPage = "redirect:/login";
        } else {
            resultPage = "redirect:/user/add";
        }

        return resultPage;
    }

    @RequestMapping(value = "/denied", method = RequestMethod.GET)
    public String denied(ModelMap model) {
        return "denied";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(ModelMap model) {
        String flag;
        String facilityFlag = "nothing";
        String binFlag = "nothing";
        String unitFlag = "nothing";
        String floorFlag = "nothing";
        if(facilityService.getByName("Merchandise Mart")!=null){
            flag =  "something";
            Facility facility = facilityService.getByName("Merchandise Mart");
            model.addAttribute("facility",facility);
            if(facility.getFloors().size()==0){
               facilityFlag = "something";
            }else{
                floorFlag = "something";
                model.addAttribute("floors",facility.getFloors());
                List<Unit> units = new ArrayList<Unit>();
                List<Bin> bins = new ArrayList<Bin>();
                for(Floor floor:facility.getFloors()){
                    for(Unit unit:floor.getUnits()){
                        units.add(unit);
                        for(Bin bin:unit.getBins()){
                            bins.add(bin);
                        }
                    }
                }
                if(units.size()!=0){
                    unitFlag = "something";
                }
                if(bins.size()!=0){
                    binFlag = "something";
                }
                flag = "something";
                model.addAttribute("bins",bins);
                model.addAttribute("units",units);
            }
        }else{
            flag = "nothing";
        }
        model.addAttribute("flag",flag);
        model.addAttribute("facilityFlag",facilityFlag);
        model.addAttribute("binFlag",binFlag);
        model.addAttribute("floorFlag",floorFlag);
        model.addAttribute("unitFlag",unitFlag);
        model.addAttribute("wasteTypes",facilityService.listWasteTypes());
        //model.addAttribute("units",facilityService.getByName("Merchandise Mart").getFloors().get(0).getUnits());
        return "admin";
    }

    @RequestMapping(value = "/admin/add/facility", method = RequestMethod.GET)
    public String addFacility(ModelMap model) {
        return "fac-add";
    }

    @RequestMapping(value = "/admin/add/facility", method = RequestMethod.POST)
    public String addFacilityPost(@ModelAttribute Facility facility, ModelMap model) {
        System.out.println("In add post method");
        String resultPage = "login";
        boolean savedUser = facilityService.create(facility);
        if (savedUser) {
            resultPage = "redirect:/admin";
        } else {
            resultPage = "redirect:/admin/add/facility";
        }

        return resultPage;
    }

    @RequestMapping(value = "/admin/facility/delete", method = RequestMethod.GET)
    public String deleteFacility(@ModelAttribute Facility facility, ModelMap model) {
        facilityService.delete(facility);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/add/floor", method = RequestMethod.GET)
    public String addFloor(ModelMap model) {
        return "floor-add";
    }

    @RequestMapping(value = "/admin/add/floor", method = RequestMethod.POST)
    public String addFloorPost(@ModelAttribute Floor floor, ModelMap model) {
        System.out.println(floor.getBarcodeId()+" "+floor.getFloorNumber()+" "+floor.getFacilityName());
        Facility facility = facilityService.getByName(floor.getFacilityName());
        facilityService.addFloor(floor);
        facility.addFloor(floor);
        System.out.println(facility.getAddress()+" "+facility.getBarcodeId()+" "+facility.getFloors()+" "+facility.getId()+" "+facility.getName()+" "+facility.getScrollbar());
        facilityService.save(facility);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/floor/delete", method = RequestMethod.GET)
    public String deleteFloor(@ModelAttribute Floor floor, ModelMap model) {
        facilityService.deleteFloor(floor);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/add/unit", method = RequestMethod.GET)
    public String addUnit(ModelMap model) {
        return "addUnit";
    }

    @RequestMapping(value = "/admin/add/unit", method = RequestMethod.POST)
    public String addUnitPost(@ModelAttribute Unit unit, ModelMap model) {
        System.out.println(unit.getBarcodeId()+" "+unit.getFloorNumber()+" "+unit.getFacilityName());
        Floor floor =  facilityService.getFloorByNumber(unit.getFloorNumber(),unit.getFacilityName());
        facilityService.addUnit(unit);
        floor.addUnit(unit);
        facilityService.saveFloor(floor);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/add/bin", method = RequestMethod.GET)
    public String addBin(ModelMap model) {
        return "bin";
    }

    @RequestMapping(value = "/admin/add/bin", method = RequestMethod.POST)
    public String addBinPost(@ModelAttribute Bin bin, ModelMap model) {
        Unit unit = facilityService.getUnitByName(bin.getFacility(),bin.getSuiteNumber());
        unit.addBin(bin);
        facilityService.saveUnit(unit);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/add/waste", method = RequestMethod.GET)
    public String addWaste(ModelMap model) {
        return "waste-type";
    }

    @RequestMapping(value = "/admin/add/waste", method = RequestMethod.POST)
    public String addWastePost(@ModelAttribute WasteType wasteType, ModelMap model) {
        facilityService.addWasteType(wasteType);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/unit/delete", method = RequestMethod.GET)
    public String deletUnit(@ModelAttribute Unit unit, ModelMap model) {
        return "redirect:/admin";
    }


}