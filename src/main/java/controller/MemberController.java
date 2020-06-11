package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.Member;
import pojo.Teacher;
import service.MemberService;
import service.TeacherService;

import java.util.List;

@Controller
public class MemberController {


    /**开发人员写了一句话*/

    @Autowired
    private MemberService memberService;

    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/member")
    public String memberShow(Model model)
    {

        /**得到毕业博士*/
        List<Member> graduationDoctor = memberService.getDoctor(1);



        /**得到现在博士*/
        List<Member> doctor = memberService.getDoctor(0);

        /**得到毕业研究生*/
        List<Member> graduate = memberService.getGraduation(1);

        /**得到现在研究生*/
        List<Member> gStudent = memberService.getGraduation(0);

        /**得到老师*/
        List<Teacher> teacher = teacherService.getTeacher();


        model.addAttribute("graduationDoctor",graduationDoctor);
        model.addAttribute("doctor",doctor);
        model.addAttribute("graduate",graduate);
        model.addAttribute("gStudent",gStudent);
        model.addAttribute("teacher",teacher);

        return "member";
    }


}
