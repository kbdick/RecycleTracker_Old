package io.recycletracker.webapp.services;

/**
 * User: alexthornburg
 * Date: 2/21/14
 * Time: 12:19 PM
 */

import io.recycletracker.webapp.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import java.util.Collection;
import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService{

    @Autowired
    private UserRepository userRepository;

    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        try {
            User authenticatedUser;
            io.recycletracker.webapp.model.User domainUser = userRepository
                    .findByUserName(username);

            boolean enabled = true;
            boolean accountNonExpired = true;
            boolean credentialsNonExpired = true;
            boolean accountNonLocked = true;

            if (domainUser != null) {
                authenticatedUser = new User(domainUser.getUserName(),
                        domainUser.getPassword().toLowerCase(), enabled,
                        accountNonExpired, credentialsNonExpired,
                        accountNonLocked, getAuthorities(0));
            } else {
                authenticatedUser = new User("admin",
                        "21232f297a57a5a743894a0e4a801fc3", true, true, true,
                        true, this.getAuthorities(0));
            }

            return authenticatedUser;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {
        List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
        return authList;
    }

    public List<String> getRoles(Integer role) {
        List<String> roles = new ArrayList<String>();

        if (role.intValue() == 1) {
            roles.add("ROLE_USER");
            roles.add("ROLE_ADMIN");

        } else if (role.intValue() == 2) {
            roles.add("ROLE_USER");
        }

        return roles;
    }

    public static List<GrantedAuthority> getGrantedAuthorities(
            List<String> roles) {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }
        return authorities;
    }
}

