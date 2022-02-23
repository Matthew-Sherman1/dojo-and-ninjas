package com.matthewsherman.dojoandninjas.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.matthewsherman.dojoandninjas.models.Dojo;
import com.matthewsherman.dojoandninjas.services.DojoService;
import com.matthewsherman.dojoandninjas.services.NinjaService;

@Controller
public class DojoController {
	
    @Autowired
    DojoService dojoService;
    
    @Autowired
    NinjaService ninjaService;
    
    @GetMapping("/")
    public String dojo(@ModelAttribute("dojo") Dojo dojo,Model model){
        System.out.println(dojoService.allDojos());
        model.addAttribute("dojos", dojoService.allDojos());
        return "dojoForm.jsp";
        
        
        
    }
    @PostMapping("/new/dojo")
    public String addDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result,Model model){
        if (result.hasErrors()) {
            model.addAttribute("dojos", dojoService.allDojos());
			return "dojoForm.jsp";
		}
		dojoService.createDojo(dojo);
		return "redirect:/";
    }
    
    
    
    
    @GetMapping("/view/dojo/{id}")
    public String showDojo(@PathVariable("id") Long id,Model model){
        Dojo oneDojo = dojoService.oneDojo(id);
        model.addAttribute("dojo", oneDojo);
        return "showDojo.jsp";
    }
}