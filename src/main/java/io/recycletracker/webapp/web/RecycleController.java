package io.recycletracker.webapp.web;

import com.google.gson.Gson;
import io.recycletracker.webapp.model.RecycleMonth;
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
	public String printWelcome(final ModelMap model, final HttpServletRequest request) {
        List<RecycleMonth> recycleList = recycleService.listMonth();
        Collections.sort(recycleList,new Comparator<RecycleMonth>() {
            public int compare(RecycleMonth c1, RecycleMonth c2) {
                return c2.getId().compareTo(c1.getId());
            }
        });
        StringBuilder sb = new StringBuilder();
        ArrayList<RecycleWeight> weightsList = new ArrayList<RecycleWeight>();
        for(RecycleMonth month:recycleList){
            RecycleWeight weight = new RecycleWeight();
            weight.setClose(month.getWetTrash()+month.getRecyclingData()+month.getOpenTop()+month.getMetal()+month.getFlourescent()+
                    month.getBallasts()+month.getIncandescent()+month.getElectronics()+month.getCompostTons()+month.getBatteries());

            weight.setDate(month.getDate());
            weightsList.add(weight);
        }
        Gson gson = new Gson();
        model.addAttribute("logoUrl", "Logo goes Here");
        model.addAttribute("data",gson.toJson(weightsList));
		return "welcome";
	}

}