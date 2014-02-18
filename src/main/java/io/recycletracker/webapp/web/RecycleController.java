package io.recycletracker.webapp.web;

import com.google.gson.Gson;
import io.recycletracker.webapp.model.RecycleDay;
import io.recycletracker.webapp.model.RecycleWeight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import java.util.*;

@Controller
@RequestMapping("/")
public class RecycleController {

    @Autowired
    private RecycleService recycleService;


	@RequestMapping(method = RequestMethod.GET)
	public String printBuilding(final ModelMap model) {
        List<RecycleDay> recycleList = recycleService.listDays();
        Collections.sort(recycleList,new Comparator<RecycleDay>() {
            public int compare(RecycleDay c1, RecycleDay c2) {
                return c2.getId().compareTo(c1.getId());
            }
        });
        ArrayList<RecycleWeight> weightsList = new ArrayList<RecycleWeight>();
        for(RecycleDay day:recycleList){
            RecycleWeight weight = new RecycleWeight();
            weight.setWeight(day.getWetTrash()*day.getDiversion1() + day.getRecyclingData() + day.getOpenTop()*day.getDiversion2() + day.getMetal() + day.getFlourescent() +
                    day.getBallasts() + day.getIncandescent() + day.getElectronics() + day.getCompostTons() + day.getBatteries());

            weight.setDate(day.getDate());
            weightsList.add(weight);
        }
        RecycleDay today = recycleList.get(0);
        double totalToday = today.addTotal();
        double recyclingToday = today.addRecycling();
        RecycleDay yesterday = recycleList.get(1);
        double totalYesterday = today.addTotal();
        double recyclingYesterday = today.addRecycling();
        double yesterdayPercentage = recyclingYesterday/totalYesterday;
        double todayPercentage = recyclingToday/totalToday;
        Gson gson = new Gson();
        model.addAttribute("data",gson.toJson(weightsList));
        model.addAttribute("date", Calendar.getInstance().getTime());
        model.addAttribute("percentage",Math.abs(todayPercentage-yesterdayPercentage*100));
        model.addAttribute("todayPercentage",todayPercentage);
		return "building";
	}
    @RequestMapping(value = "/day", method = RequestMethod.GET)
    public String getPersonList(ModelMap model) {
        model.addAttribute("recycleList", recycleService.listDays());
        return "add-data";
    }

    @RequestMapping(value = "/day/add", method = RequestMethod.POST)
    public View createPerson(@ModelAttribute RecycleDay day, ModelMap model) {
        if(StringUtils.hasText(day.getId())) {
            recycleService.updateDays(day);
        } else {
            recycleService.addDay(day);
        }
        return new RedirectView("/day");
    }

    @RequestMapping(value = "/day/delete", method = RequestMethod.GET)
    public View deletePerson(@ModelAttribute RecycleDay day, ModelMap model) {
        recycleService.deleteDays(day);
        return new RedirectView("/day");
    }

}