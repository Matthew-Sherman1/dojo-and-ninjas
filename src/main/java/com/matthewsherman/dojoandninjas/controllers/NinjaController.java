package com.matthewsherman.dojoandninjas.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.matthewsherman.dojoandninjas.models.Ninja;
import com.matthewsherman.dojoandninjas.services.DojoService;
import com.matthewsherman.dojoandninjas.services.NinjaService;

@Controller
public class NinjaController {
	
    @Autowired
    NinjaService ninjaService;
    
    @Autowired
    DojoService dojoService;

    @GetMapping("/ninja")
    public String ninja(@ModelAttribute("ninja") Ninja ninja,Model model){
        model.addAttribute("dojos",dojoService.allDojos());
        return "ninjaForm.jsp";
    }
    
    
    
    
    @PostMapping("/new/ninja")
    public String addNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result,Model model){
        if (result.hasErrors()) {
            System.out.println(result);
            model.addAttribute("dojos",dojoService.allDojos());
			return "ninjaForm.jsp";
		}
		ninjaService.createNinja(ninja);
		return "redirect:/";
    }
}