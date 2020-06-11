package controller;


import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Education;
import pojo.Teacher;
import service.EducationService;
import service.TeacherService;

import java.util.List;

@Controller
public class TeacherController {

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private EducationService educationService;

    @RequestMapping("/teacherTip/{id}")
    @ResponseBody
    public JSONObject getTeacherTip(@PathVariable ("id") String ID)
    {


        /**老师基本信息*/
        Teacher teachers = teacherService.ById(ID);
        /**教育经历*/
        List<Education> educations = educationService.ByID(ID);

        JSONObject result=new JSONObject();
        result.put("teachers",teachers);
        result.put("educations",educations);


        System.out.println(result);
        return result;
    }

}
