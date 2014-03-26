package io.recycletracker.webapp.repo;

import io.recycletracker.webapp.model.Facility;
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
public class FacilityRepo {

    @Qualifier("mongoTemplate")
    @Autowired
    private MongoTemplate mongoTemplate;

    public static final String COLLECTION_NAME = "facility";

    public void addFacility(Facility facility) {
        if (!mongoTemplate.collectionExists(Facility.class)) {
            mongoTemplate.createCollection(Facility.class);
        }
        facility.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(facility, COLLECTION_NAME);
    }

    public List<Facility> listFacilities() {
        return mongoTemplate.findAll(Facility.class, COLLECTION_NAME);
    }
    public void deleteFacility(Facility facility) {
        mongoTemplate.remove(facility, COLLECTION_NAME);
    }

    public void updateFacility(Facility facility) {
        mongoTemplate.save(facility);
    }

    public Facility findByName(String name) {
        Query query = new Query();
        query.addCriteria(Criteria.where("name").is(name));
        return mongoTemplate.findOne(query,Facility.class);
    }
}
