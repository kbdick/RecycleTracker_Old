package io.recycletracker.webapp.repo;

import io.recycletracker.webapp.model.WasteType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

/**
 * User: alexthornburg
 * Date: 3/12/14
 * Time: 10:08 PM
 */
@Repository
public class WasteTypeRepo {

    @Qualifier("mongoTemplate")
    @Autowired
    private MongoTemplate mongoTemplate;

    public static final String COLLECTION_NAME = "wasteType";

    public void addWasteType(WasteType wasteType) {
        if (!mongoTemplate.collectionExists(WasteType.class)) {
            mongoTemplate.createCollection(WasteType.class);
        }
        wasteType.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(wasteType, COLLECTION_NAME);
    }

    public List<WasteType> listWasteTypes() {
        return mongoTemplate.findAll(WasteType.class, COLLECTION_NAME);
    }
    public void deleteWasteType(WasteType wasteType) {
        mongoTemplate.remove(wasteType, COLLECTION_NAME);
    }

    public void updateWasteType(WasteType wasteType) {
        mongoTemplate.save(wasteType, COLLECTION_NAME);
    }

    public WasteType findByName(String name) {
        Query query = new Query();
        query.addCriteria(Criteria.where("name").is(name));
        return mongoTemplate.findOne(query,WasteType.class);
    }
}
