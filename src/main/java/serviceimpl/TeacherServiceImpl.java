package serviceimpl;


import dao.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import pojo.Teacher;
import pojo.TeacherExample;
import service.TeacherService;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService{

    @Autowired
    private TeacherMapper teacherService;

    /**得到老师*/
    public List<Teacher> getTeacher() {


        TeacherExample example=new TeacherExample();
        return teacherService.selectByExample(example);
    }

    public Teacher ById(String ID) {
        return teacherService.selectByPrimaryKey(ID);
    }
}
