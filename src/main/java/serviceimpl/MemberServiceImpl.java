package serviceimpl;


import dao.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Member;
import pojo.MemberExample;
import service.MemberService;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;



    /**得到博士生*/
    public List<Member> getDoctor(Integer isGraduate) {

        MemberExample example=new MemberExample();
        MemberExample.Criteria criteria=example.createCriteria();

        /**已经毕业*/
        if (isGraduate==1)
        {
            criteria.andGraduateEqualTo(isGraduate);
        }
        else
        {
            /**没有毕业*/
            criteria.andGraduateEqualTo(isGraduate);
        }
        /**博士*/
        criteria.andStatusEqualTo(1);

        List<Member> members = memberMapper.selectByExample(example);

        return members;
    }

    public List<Member> getGraduation(Integer isGraduate) {


        MemberExample example=new MemberExample();
        MemberExample.Criteria criteria=example.createCriteria();

        /**已经毕业*/
        if (isGraduate==1)
        {
            criteria.andGraduateEqualTo(isGraduate);
        }
        else
        {
            /**没有毕业*/
            criteria.andGraduateEqualTo(isGraduate);
        }
        /**研究生*/
        criteria.andStatusEqualTo(2);

        List<Member> members = memberMapper.selectByExample(example);

        return members;
    }



}
