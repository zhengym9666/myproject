package com.community.bean;/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import net.sf.json.JSONObject;

public class User{
    /**
     * �û�Ψһid
     */
    private String userId;
    /**
     * ���������
     */
    private String userRealName;
    /**
     * �����ĸ���֯,���ڻ�ȡ�����б���֯��Ϣ
     */
    private String userGroupTopId;
    /**
     * �û���ɫ 1����Ա��2��ͨ��Ա
     */
    private int userRole;
    /**
     * �û�ͷ��url
     */
    private String userImgUrl;




    public User() {
    }

    public User(JSONObject userData) {
        if (userData.containsKey("userId")) {
            this.userId = userData.getString("userId");
        }
        if (userData.containsKey("userRealName")) {
            this.userRealName = userData.getString("userRealName");
        }
        if (userData.containsKey("userGroupTopId")) {
            this.userGroupTopId = userData.getString("userGroupTopId");
        }
        if (userData.containsKey("userRole")) {
            this.userRole = userData.getInt("userRole");
        }
        if (userData.containsKey("userImgUrl")) {
            this.userImgUrl = userData.getString("userImgUrl");
        }
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserRealName() {
        return userRealName;
    }

    public void setUserRealName(String userRealName) {
        this.userRealName = userRealName;
    }

    public String getUserGroupTopId() {
        return userGroupTopId;
    }

    public void setUserGroupTopId(String userGroupTopId) {
        this.userGroupTopId = userGroupTopId;
    }

    public int getUserRole() {
        return userRole;
    }

    public void setUserRole(int userRole) {
        this.userRole = userRole;
    }

    public String getUserImgUrl() {
        return userImgUrl;
    }

    public void setUserImgUrl(String userImgUrl) {
        this.userImgUrl = userImgUrl;
    }
}