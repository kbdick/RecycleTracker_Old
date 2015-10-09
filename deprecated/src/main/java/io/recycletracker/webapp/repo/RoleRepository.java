package io.recycletracker.webapp.repo;

import org.springframework.data.mongodb.repository.MongoRepository;
import io.recycletracker.webapp.model.Role;

/**
 * User: alexthornburg
 * Date: 3/10/14
 * Time: 9:23 PM
 */
public interface RoleRepository extends MongoRepository<Role, String> {
    Role findOne(String role);
}
