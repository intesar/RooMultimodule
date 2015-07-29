package com.example.petclinic.ui.mvc;
import com.example.petclinic.domain.Vet;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/vets")
@Controller
@RooWebScaffold(path = "vets", formBackingObject = Vet.class)
public class VetController {
}
