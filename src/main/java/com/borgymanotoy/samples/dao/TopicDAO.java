package com.borgymanotoy.samples.dao;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Sorts;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;

import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Filters.in;

public class TopicDAO {
    private final MongoCollection<Document> topicCollection;

    public TopicDAO(final MongoDatabase blogDatabase) {
        topicCollection = blogDatabase.getCollection("topics");
    }

    public Document findById(String id) {
        Document topic = topicCollection.find(eq("_id", id)).first();
        return topic;
    }

    public List<Document> findByDateDescending(int limit) {
        return topicCollection.find()
                       .sort(Sorts.descending("creationDate"))
                       .limit(limit)
                       .into(new ArrayList<>());
    }

    public List<Document> findByClassCodeDateDescending(String classCode) {
        return topicCollection.find(eq("classCode", classCode))
                .sort(Sorts.descending("creationDate"))
                .limit(20)
                .into(new ArrayList<>());
    }

    public int getCourseTopicsCount(String classCode) {
        List<Document> list = topicCollection.find(eq("classCode", classCode)).into(new ArrayList<>());
        return null!=list ? list.size() : 0;
    }

    public List<Document> findByClassesLatest(String[] classCodes) {
        //{ "classCode": { "$in": [ "CS21", "CS44" ] } }
        return topicCollection.find(in("classCode", classCodes))
                       .sort(Sorts.descending("creationDate"))
                       .limit(10)
                       .into(new ArrayList<>());
    }

    public boolean addTopic(Document topic) {
        if(null!=topic){
            try {
                topicCollection.insertOne(topic);
                System.out.println("Successfully added a Topic!");
                return true;
            } catch (Exception e) {
                System.out.println("Error inserting post");
            }
        }

        return false;
    }

    public boolean removeTopic(String id) {
        if(null!=id && !"".equals(id.trim())){
            try {
                topicCollection.deleteOne(eq("_id", id));
                System.out.println("Removing topic('" + id + "'): ");
                return true;
            } catch (Exception e) {
                System.out.println("Error removing topic('" + id + "')");
            }
        }
        return false;
    }

}
