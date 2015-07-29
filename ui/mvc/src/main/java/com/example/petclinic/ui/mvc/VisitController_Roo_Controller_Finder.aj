// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.example.petclinic.ui.mvc;

import com.example.petclinic.domain.Visit;
import com.example.petclinic.ui.mvc.VisitController;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect VisitController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByDescriptionAndVisitDate", "form" }, method = RequestMethod.GET)
    public String VisitController.findVisitsByDescriptionAndVisitDateForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "visits/findVisitsByDescriptionAndVisitDate";
    }
    
    @RequestMapping(params = "find=ByDescriptionAndVisitDate", method = RequestMethod.GET)
    public String VisitController.findVisitsByDescriptionAndVisitDate(@RequestParam("description") String description, @RequestParam("visitDate") @DateTimeFormat(style = "M-") Date visitDate, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("visits", Visit.findVisitsByDescriptionAndVisitDate(description, visitDate, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Visit.countFindVisitsByDescriptionAndVisitDate(description, visitDate) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("visits", Visit.findVisitsByDescriptionAndVisitDate(description, visitDate, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "visits/list";
    }
    
    @RequestMapping(params = { "find=ByDescriptionLike", "form" }, method = RequestMethod.GET)
    public String VisitController.findVisitsByDescriptionLikeForm(Model uiModel) {
        return "visits/findVisitsByDescriptionLike";
    }
    
    @RequestMapping(params = "find=ByDescriptionLike", method = RequestMethod.GET)
    public String VisitController.findVisitsByDescriptionLike(@RequestParam("description") String description, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("visits", Visit.findVisitsByDescriptionLike(description, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Visit.countFindVisitsByDescriptionLike(description) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("visits", Visit.findVisitsByDescriptionLike(description, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "visits/list";
    }
    
    @RequestMapping(params = { "find=ByVisitDateBetween", "form" }, method = RequestMethod.GET)
    public String VisitController.findVisitsByVisitDateBetweenForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "visits/findVisitsByVisitDateBetween";
    }
    
    @RequestMapping(params = "find=ByVisitDateBetween", method = RequestMethod.GET)
    public String VisitController.findVisitsByVisitDateBetween(@RequestParam("minVisitDate") @DateTimeFormat(style = "M-") Date minVisitDate, @RequestParam("maxVisitDate") @DateTimeFormat(style = "M-") Date maxVisitDate, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("visits", Visit.findVisitsByVisitDateBetween(minVisitDate, maxVisitDate, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Visit.countFindVisitsByVisitDateBetween(minVisitDate, maxVisitDate) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("visits", Visit.findVisitsByVisitDateBetween(minVisitDate, maxVisitDate, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "visits/list";
    }
    
}