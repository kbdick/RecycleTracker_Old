package io.recycletracker.webapp.repo;

import io.recycletracker.webapp.model.Unit;
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
public class UnitRepo {

    @Qualifier("mongoTemplate")
    @Autowired
    private MongoTemplate mongoTemplate;

    public static final String COLLECTION_NAME = "unit";

    public void addUnit(Unit unit) {
        if (!mongoTemplate.collectionExists(Unit.class)) {
            mongoTemplate.createCollection(Unit.class);
        }
        unit.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(unit, COLLECTION_NAME);
    }

    public List<Unit> listUnits() {
        return mongoTemplate.findAll(Unit.class, COLLECTION_NAME);
    }
    public void deleteUnit(Unit unit) {
        mongoTemplate.remove(unit, COLLECTION_NAME);
    }

    public void updateUnit(Unit unit) {
        mongoTemplate.save(unit, COLLECTION_NAME);
    }

    public Unit getUnitByName(String facilityName,int suiteNumber){
        Query query = new Query();
        query.addCriteria(Criteria.where("facilityName").is(facilityName).and("suiteNumber").is(suiteNumber));
        return mongoTemplate.findOne(query,Unit.class);
    }
}
