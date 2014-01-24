package io.recycletracker.webapp.web;

import io.recycletracker.webapp.model.RecycleMonth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
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
        /*try {
            FileWriter writer = new FileWriter(request.getSession().getServletContext().getRealPath("/")+"res/"+"data.tsv");
            writer.write("date\t"+"close\n");
            for(RecycleMonth month:recycleList){
                double monthTotal = month.getWetTrash()+month.getRecyclingData()+month.getOpenTop()+month.getMetal()+month.getFlourescent()+
                        month.getBallasts()+month.getIncandescent()+month.getElectronics()+month.getCompostTons()+month.getBatteries();
                writer.write(month.getDate()+"\t"+monthTotal+"\n");
            }
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        StringBuilder sb = new StringBuilder();
        sb.append("date\t"+"close\n");
        for(RecycleMonth month:recycleList){
            double monthTotal = month.getWetTrash()+month.getRecyclingData()+month.getOpenTop()+month.getMetal()+month.getFlourescent()+
                    month.getBallasts()+month.getIncandescent()+month.getElectronics()+month.getCompostTons()+month.getBatteries();
            sb.append(month.getDate()+"\t"+monthTotal+"\n");
        }
        model.addAttribute("logoUrl", "Logo goes Here");
        model.addAttribute("data",sb.toString());
		return "welcome";
	}

}