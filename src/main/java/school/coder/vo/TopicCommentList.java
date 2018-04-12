package school.coder.vo;

import school.coder.domain.TopicCommentInfo;
import school.coder.domain.TopicCommentInfoEx;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/2/20.
 */
public class TopicCommentList {
    private int curr_comment_id;
    private String curr_comment_content;
    private Date curr_comment_createtime;
    private int curr_comment_user_id;
    private String curr_user_name;
    private String curr_user_avatar;

    public String getCurr_user_name() {
        return curr_user_name;
    }

    public void setCurr_user_name(String curr_user_name) {
        this.curr_user_name = curr_user_name;
    }

    public String getCurr_user_avatar() {
        return curr_user_avatar;
    }

    public void setCurr_user_avatar(String curr_user_avatar) {
        this.curr_user_avatar = curr_user_avatar;
    }

    private List<TopicCommentInfoEx> childCommentList;

    public int getCurr_comment_id() {
        return curr_comment_id;
    }

    public void setCurr_comment_id(int curr_comment_id) {
        this.curr_comment_id = curr_comment_id;
    }

    public String getCurr_comment_content() {
        return curr_comment_content;
    }

    public void setCurr_comment_content(String curr_comment_content) {
        this.curr_comment_content = curr_comment_content;
    }

    public Date getCurr_comment_createtime() {
        return curr_comment_createtime;
    }

    public void setCurr_comment_createtime(Date curr_comment_createtime) {
        this.curr_comment_createtime = curr_comment_createtime;
    }

    public int getCurr_comment_user_id() {
        return curr_comment_user_id;
    }

    public void setCurr_comment_user_id(int curr_comment_user_id) {
        this.curr_comment_user_id = curr_comment_user_id;
    }

    public List<TopicCommentInfoEx> getChildCommentList() {
        return childCommentList;
    }

    public void setChildCommentList(List<TopicCommentInfoEx> childCommentList) {
        this.childCommentList = childCommentList;
    }
}
