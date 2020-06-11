package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.News;
import pojo.Teacher;
import service.NewsService;
import service.TeacherService;

import javax.jws.WebParam;
import java.util.List;

@Controller
public class Page {

    @Autowired
    private NewsService newsService;
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/")
    public String indexShow() {

        return "index";
    }


    @RequestMapping("/first")
    public String firstShow(Model model) {


        /**最近3条细纹*/
       List<News> news= newsService.getRecentlyNews();
       model.addAttribute("recently",news);

       /**得到老师*/
        List<Teacher> teacher = teacherService.getTeacher();
        model.addAttribute("teacher",teacher);
        return "first";
    }


}
