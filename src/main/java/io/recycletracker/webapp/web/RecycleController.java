package io.recycletracker.webapp.web;

import com.google.gson.Gson;
import io.recycletracker.webapp.model.RecycleDay;
import io.recycletracker.webapp.model.RecycleWeight;
import io.recycletracker.webapp.repo.RecycleService;
import org.springframework.beans.factory.annotation.Autowired;
import io.recycletracker.webapp.model.UserUI;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import io.recycletracker.webapp.services.UserService;

import java.util.*;


@Controller
@RequestMapping("/")
public class RecycleController {

    @Autowired
    private RecycleService recycleService;

    @Autowired
    private UserService userService;


	@RequestMapping(method = RequestMethod.GET)
	public String printBuilding(final ModelMap model) {
        List<RecycleDay> recycleList = recycleService.listDays();
        Collections.sort(recycleList,new Comparator<RecycleDay>() {
            public int compare(RecycleDay c1, RecycleDay c2) {
                return c2.getDate().compareTo(c1.getDate());
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
        model.addAttribute("percentage",Math.round(Math.abs(todayPercentage - yesterdayPercentage * 100)));
        model.addAttribute("todayPercentage",Math.round(todayPercentage*100));
		return "building";
	}
    @RequestMapping(value = "/day", method = RequestMethod.GET)
    public String getPersonList(ModelMap model) {
        model.addAttribute("recycleList", recycleService.listDays());
        return "add-data";
    }

    @RequestMapping(value = "/day/add", method = RequestMethod.POST)
    public String createDAy(@ModelAttribute RecycleDay day, ModelMap model) {
        if(StringUtils.hasText(day.getId())) {
            recycleService.updateDay(day);
        } else {
            recycleService.addDay(day);
        }
        return "redirect:/day";
    }

    @RequestMapping(value = "/day/delete", method = RequestMethod.GET)
    public String deleteDay(@ModelAttribute RecycleDay day, ModelMap model) {
        recycleService.deleteDay(day);
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

        if (userService.findByUsername(user.getUserName()) != null) {
            resultPage = "redirect:/user/add";
        }

        UserUI savedUser = userService.create(user);
        if (savedUser != null) {
            resultPage = "redirect:/login";
        } else {
            resultPage = "redirect:/user/add";
        }

        return resultPage;
    }


}