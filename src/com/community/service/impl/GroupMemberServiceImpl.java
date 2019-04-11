package com.community.service.impl;

import com.community.bean.News;
import com.community.dao.NewsDAO;
import com.community.model.base.User;
import com.community.util.MybatisUtil;
import com.community.web.StudentAction;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.GroupMember;
import com.community.dao.GroupMemberDAO;
import com.community.service.interfaces.IGroupMemberService;

import java.util.HashMap;
import java.util.List;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 上午9:37:59
* @version 1.0 
* @desrciption		
*/
@Service("groupMemberService")
public class GroupMemberServiceImpl extends AbsServiceImpl<GroupMemberDAO> implements IGroupMemberService {

	@Override
	public String getDepartmentId(String stuNum, String clubId) {
		return mapper.getDepartmentId(stuNum, clubId);
	}

	@Override
	public GroupMember queryMemberInfo(String stuNum, String clubId) {
		return mapper.queryMemberInfo(stuNum, clubId);
	}

	@Override
	public List<GroupMember> queryMemberListByClubId(String clubId) {
		return mapper.queryMemberListByClubId(clubId);
	}

	@Override
	public User getUserByName(String userName) {
		return mapper.getUserByName(userName);
	}



	@Override
	public void saveMemberInfo(GroupMember memberInfo) {
		// TODO Auto-generated method stub
		mapper.saveMemberInfo(memberInfo);
	}

	@Override
	public GroupMember getAuditor(String departId, String clubId, int rank) {
		// TODO Auto-generated method stub
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("departId", departId);
		params.put("clubId", clubId);
		params.put("rank", rank);
        List<GroupMember> auditor = mapper.getAuditor(params);
        GroupMember groupMember=null;
        if(auditor!=null && auditor.size()>0){
            groupMember=auditor.get(0);
        }
        return groupMember;
	}

    public static void main(String[] args) throws Exception {
        MybatisUtil util=new MybatisUtil();
        GroupMemberServiceImpl service = util.getMapperServiceImplObject(GroupMemberDAO.class, GroupMemberServiceImpl.class);
        //List<GroupMember> groupMember = service.queryMemberListByClubId("1010000");
        //System.out.println(groupMember);
        GroupMember auditor = service.getAuditor("", "1010100", 1);
        System.out.println(auditor);
    }

}
