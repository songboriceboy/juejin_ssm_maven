package school.coder.vo;

import java.util.List;

/**
 * Created by ttc on 2018/4/19.
 */
public class JsonData<T> {
    private List<T> list;

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
