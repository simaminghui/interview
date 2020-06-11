package service;

import pojo.Member;

import java.util.List;

public interface MemberService {

    /**得到博士，1表示毕业，0表示没有*/
    List<Member> getDoctor(Integer isGraduate);

    /**得到研究生，1表示毕业，0表示没有*/
    List<Member> getGraduation(Integer isGraduate);



}
