package io.recycletracker.webapp.repo;

import io.recycletracker.webapp.model.Bin;
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
public class BinRepo {

    @Qualifier("mongoTemplate")
    @Autowired
    private MongoTemplate mongoTemplate;

    public static final String COLLECTION_NAME = "bin";

    public void addBin(Bin bin) {
        if (!mongoTemplate.collectionExists(Bin.class)) {
            mongoTemplate.createCollection(Bin.class);
        }
        bin.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(bin, COLLECTION_NAME);
    }

    public List<Bin> listBins() {
        return mongoTemplate.findAll(Bin.class, COLLECTION_NAME);
    }
    public void deleteBin(Bin bin) {
        mongoTemplate.remove(bin, COLLECTION_NAME);
    }

    public void updateBin(Bin bin) {
        mongoTemplate.insert(bin, COLLECTION_NAME);
    }

    public List<Bin> getBinByFacility(String name){
        Query query = new Query();
        query.addCriteria(Criteria.where("facility").is(name));
        return mongoTemplate.find(query,Bin.class);
    }
}
