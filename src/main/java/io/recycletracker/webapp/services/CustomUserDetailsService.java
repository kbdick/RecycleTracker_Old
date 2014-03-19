package io.recycletracker.webapp.services;

/**
 * User: alexthornburg
 * Date: 2/21/14
 * Time: 12:19 PM
 */

import io.recycletracker.webapp.model.UserAccountStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.List;

@Component
public class CustomUserDetailsService extends AbstractUserDetailsAuthenticationProvider {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired UserService userService;

    @Autowired private PasswordEncoder encoder;

    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken authentication)
            throws AuthenticationException {
    }

    @Override
    public UserDetails retrieveUser(String username, UsernamePasswordAuthenticationToken authentication)
            throws AuthenticationException {
        String password = (String) authentication.getCredentials();
        if (!StringUtils.hasText(password)) {
            logger.warn("Username {}: no password provided", username);
            throw new BadCredentialsException("Please enter password");
        }

        io.recycletracker.webapp.model.User user = userService.getByUsername(username);
        if (user == null) {
            logger.warn("Username {} password {}: user not found", username, password);
            throw new UsernameNotFoundException("Invalid Login");
        }

        if (!encoder.matches(password, user.getPassword())) {
            logger.warn("Username {} password {}: invalid password", username, password);
            throw new BadCredentialsException("Invalid Login");
        }

        if (!(UserAccountStatus.STATUS_APPROVED.name().equals(user.getStatus()))) {
            logger.warn("Username {}: not approved", username);
            throw new BadCredentialsException("User has not been approved");
        }
        if (!user.getEnabled()) {
            logger.warn("Username {}: disabled", username);
            throw new BadCredentialsException("User disabled");
        }

        final List<GrantedAuthority> authorities;
        if (!user.getRoles().isEmpty()) {
            authorities = AuthorityUtils.commaSeparatedStringToAuthorityList(user.getRolesCSV());
        } else {
            authorities = AuthorityUtils.NO_AUTHORITIES;
        }

        return new User(username, password, user.getEnabled(), // enabled
                true, // account not expired
                true, // credentials not expired
                true, // account not locked
                authorities);
    }
}

