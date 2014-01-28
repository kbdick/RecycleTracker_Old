package io.recycletracker.webapp.web;

import com.google.gson.Gson;
import io.recycletracker.webapp.model.RecycleDay;
import io.recycletracker.webapp.model.RecycleWeight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("/")
public class RecycleController {

    @Autowired
    private RecycleService recycleService;


	@RequestMapping(method = RequestMethod.GET)
	public String printBuilding(final ModelMap model, final HttpServletRequest request) {
        List<RecycleDay> recycleList = recycleService.listDays();
        Collections.sort(recycleList,new Comparator<RecycleDay>() {
            public int compare(RecycleDay c1, RecycleDay c2) {
                return c2.getId().compareTo(c1.getId());
            }
        });
        StringBuilder sb = new StringBuilder();
        ArrayList<RecycleWeight> weightsList = new ArrayList<RecycleWeight>();
        for(RecycleDay day:recycleList){
            RecycleWeight weight = new RecycleWeight();
            weight.setWeight(day.getWetTrash()*day.getDiversion1() + day.getRecyclingData() + day.getOpenTop()*day.getDiversion2() + day.getMetal() + day.getFlourescent() +
                    day.getBallasts() + day.getIncandescent() + day.getElectronics() + day.getCompostTons() + day.getBatteries());

            weight.setDate(day.getDate());
            weightsList.add(weight);
        }
        RecycleDay today = recycleList.get(0);
        double totalToday = today.getWetTrash() + today.getRecyclingData() + today.getOpenTop() +
                today.getMetal() + today.getFlourescent() +
                today.getBallasts() + today.getIncandescent()
                + today.getElectronics() + today.getCompostTons() + today.getBatteries();
        double recyclingToday = today.getRecyclingData()* today.getDiversion1()
                + today.getOpenTop()*today.getDiversion2() +
                today.getMetal() + today.getFlourescent() +
                today.getBallasts() + today.getIncandescent()
                + today.getElectronics() + today.getCompostTons() + today.getBatteries();
        RecycleDay yesterday = recycleList.get(1);
        double totalYesterday = yesterday.getWetTrash() + yesterday.getRecyclingData() + yesterday.getOpenTop() +
                yesterday.getMetal() + yesterday.getFlourescent() +
                yesterday.getBallasts() + yesterday.getIncandescent()
                + yesterday.getElectronics() + yesterday.getCompostTons() + yesterday.getBatteries();
        double recyclingYesterday = yesterday.getRecyclingData()* yesterday.getDiversion1() +
                + yesterday.getOpenTop()*yesterday.getDiversion2() +
                yesterday.getMetal() + yesterday.getFlourescent() +
                yesterday.getBallasts() + yesterday.getIncandescent()
                + yesterday.getElectronics() + yesterday.getCompostTons() + yesterday.getBatteries();
        double yesterdayPercentage = recyclingYesterday/totalYesterday;
        double todayPercentage = recyclingToday/totalToday;
        Gson gson = new Gson();
        model.addAttribute("logoUrl", "Logo goes Here");
        model.addAttribute("data",gson.toJson(weightsList));
        if((todayPercentage - yesterdayPercentage)<0){
            model.addAttribute("trend","down_arrow");
        }else{
            model.addAttribute("trend","up_arrow");
        }
        model.addAttribute("percentage",Math.abs(todayPercentage-yesterdayPercentage*100));
		return "building";
	}

}