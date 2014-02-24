package io.recycletracker.webapp.repo;

/**
 * User: alexthornburg
 * Date: 2/21/14
 * Time: 12:21 PM
 */
import io.recycletracker.webapp.model.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends MongoRepository<User, String>,
            PagingAndSortingRepository<User, String> {

    User findByUserName(String userName);
}

