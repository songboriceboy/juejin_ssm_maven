package school.coder.domain;


import school.coder.domain.TagInfo;

/**
 * Created by Administrator on 2018/4/13.
 */
public class TagInfoEx extends TagInfo {
    private int article_num;
    private int follow_num;

    public int getArticle_num() {
        return article_num;
    }

    public void setArticle_num(int article_num) {
        this.article_num = article_num;
    }

    public int getFollow_num() {
        return follow_num;
    }

    public void setFollow_num(int follow_num) {
        this.follow_num = follow_num;
    }
}
