package io.recycletracker.webapp.web;

/**
 * User: alexthornburg
 * Date: 1/20/14
 * Time: 7:37 PM
 */
import io.recycletracker.webapp.model.RecycleDay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public class RecycleService {
    @Autowired
    private MongoTemplate mongoTemplate;

    public static final String COLLECTION_NAME = "recycleDays";

    public void addMonth(RecycleDay day) {
        if (!mongoTemplate.collectionExists(RecycleDay.class)) {
            mongoTemplate.createCollection(RecycleDay.class);
        }
        day.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(day, COLLECTION_NAME);
    }

    public List<RecycleDay> listDays() {
        return mongoTemplate.findAll(RecycleDay.class, COLLECTION_NAME);
    }

    public void deleteDays(RecycleDay day) {
        mongoTemplate.remove(day, COLLECTION_NAME);
    }

    public void updateDays(RecycleDay day) {
        mongoTemplate.insert(day, COLLECTION_NAME);
    }


}
