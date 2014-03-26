package io.recycletracker.webapp.repo;

import io.recycletracker.webapp.model.Floor;
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
 * Time: 10:07 PM
 */
@Repository
public class FloorRepo {

    @Qualifier("mongoTemplate")
    @Autowired
    private MongoTemplate mongoTemplate;

    public static final String COLLECTION_NAME = "floor";

    public void addFloor(Floor floor) {
        if (!mongoTemplate.collectionExists(Floor.class)) {
            mongoTemplate.createCollection(Floor.class);
        }
        floor.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(floor, COLLECTION_NAME);
    }

    public List<Floor> listFloors() {
        return mongoTemplate.findAll(Floor.class, COLLECTION_NAME);
    }
    public void delete(Floor floor) {
        mongoTemplate.remove(floor, COLLECTION_NAME);
    }

    public void updateFloor(Floor floor) {
        mongoTemplate.save(floor, COLLECTION_NAME);
    }

    public Floor findByName(int floorNumber,String name) {
        Query query = new Query();
        query.addCriteria(Criteria.where("facilityName").is(name).and("floorNumber").is(floorNumber));
        return mongoTemplate.findOne(query,Floor.class);
    }
}
