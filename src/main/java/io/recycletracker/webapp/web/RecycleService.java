package io.recycletracker.webapp.web;

/**
 * User: alexthornburg
 * Date: 1/20/14
 * Time: 7:37 PM
 */
import io.recycletracker.webapp.model.RecycleMonth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public class RecycleService {
    @Autowired
    private MongoTemplate mongoTemplate;

    public static final String COLLECTION_NAME = "recycleMonth";

    public void addMonth(RecycleMonth month) {
        if (!mongoTemplate.collectionExists(RecycleMonth.class)) {
            mongoTemplate.createCollection(RecycleMonth.class);
        }
        month.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(month, COLLECTION_NAME);
    }

    public List<RecycleMonth> listMonth() {
        return mongoTemplate.findAll(RecycleMonth.class, COLLECTION_NAME);
    }

    public void deleteMonth(RecycleMonth person) {
        mongoTemplate.remove(person, COLLECTION_NAME);
    }

    public void updateMonth(RecycleMonth month) {
        mongoTemplate.insert(month, COLLECTION_NAME);
    }


}
