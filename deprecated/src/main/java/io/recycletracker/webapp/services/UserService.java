package io.recycletracker.webapp.services;

/**
 * User: alexthornburg
 * Date: 2/24/14
 * Time: 10:32 AM
 */

import io.recycletracker.webapp.model.Role;
import io.recycletracker.webapp.model.UserAccountStatus;
import io.recycletracker.webapp.repo.RoleRepository;
import io.recycletracker.webapp.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import io.recycletracker.webapp.model.User;

@Service
public class UserService {

    @Autowired private UserRepository userRepository;

    @Autowired private RoleRepository roleRepository;

    @Autowired private PasswordEncoder encoder;

    public Role getRole(String role) {
        return roleRepository.findOne(role);
    }

    public boolean create(User user) {
        Assert.isNull(user.getId());

        // duplicate username
        if (userRepository.findByUsername(user.getUsername()) != null) {
            return false;
        }
        user.setPassword(encoder.encode(user.getPassword()));
        user.setEnabled(true);
        user.setStatus(UserAccountStatus.STATUS_APPROVED.name());
        userRepository.save(user);
        return true;
    }

    public void save(User user) {
        Assert.notNull(user.getId());
        userRepository.save(user);
    }

    public void delete(User user) {
        Assert.notNull(user.getId());
        userRepository.delete(user);
    }

    public User getByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
