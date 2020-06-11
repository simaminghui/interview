package service;

import pojo.Teacher;

import java.util.List;

public interface TeacherService {

    List<Teacher> getTeacher();
    Teacher ById(String ID);
}
