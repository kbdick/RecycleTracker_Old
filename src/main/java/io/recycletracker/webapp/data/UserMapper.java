package io.recycletracker.webapp.data;

import io.recycletracker.webapp.model.User;
import io.recycletracker.webapp.UI.UserUI;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
/**
 * User: alexthornburg
 * Date: 2/24/14
 * Time: 10:36 AM
 */
public class UserMapper {
    public UserUI toUIBean(User user) {
        UserUI uiBean = null;

        if (user != null) {
            uiBean = new UserUI();
            uiBean.setFirstname(user.getFirstname());
            uiBean.setId(user.getId());
            uiBean.setLastname(user.getLastname());
            uiBean.setPassword(user.getPassword());
            uiBean.setUsername(user.getUsername());
        }

        return uiBean;
    }

    public List<UserUI> toUIBean(List<User> users) {
        List<UserUI> uiBeans = new ArrayList<UserUI>();

        for (User user : users) {
            uiBeans.add(toUIBean(user));
        }
        return uiBeans;
    }

    public Page<UserUI> toUIBean(Page<User> users, Pageable pageable) {
        Page<UserUI> uiBeans = new PageImpl<UserUI>(
                toUIBean(users.getContent()), pageable,
                users.getTotalElements());

        return uiBeans;
    }

    public User toPersistenceBean(UserUI uiBean) {
        User user = null;

        if (uiBean != null) {
            user = new User();
            user.setFirstname(uiBean.getFirstname());
            user.setId(uiBean.getId());
            user.setLastname(uiBean.getLastname());
            user.setPassword(uiBean.getPassword());
            user.setUsername(uiBean.getUsername());
        }
        return user;
    }

    public List<User> toPersistenceBean(List<UserUI> uiBeans) {
        List<User> users = new ArrayList<User>();

        for (UserUI uiBean : uiBeans) {
            users.add(toPersistenceBean(uiBean));
        }
        return users;
    }
}