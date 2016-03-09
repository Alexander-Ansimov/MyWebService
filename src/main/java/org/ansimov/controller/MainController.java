package org.ansimov.controller;

//import org.json.simple.parser.JSONParser;
import org.ansimov.model.User;
//import org.json.simple.parser.ParseException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
public class MainController {

    private static Long id = 1L;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String mainMethod() {
        return "home";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String allUsers(Model model) {
        /*User myUser = new User();
        myUser.setFirstName("Ivan");
        myUser.setLastName("Ivanov");
        myUser.setDescribe("This is my first User");
        model.addAttribute()*/
        return "all";
    }

    @RequestMapping(value = "/user", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public User addUser(@RequestBody User user) {
        System.out.println("user = " + user.toString());

        //Here we make record to DB and return User with id
        user.setId(id);
        id++;

        return user;
    }

}
