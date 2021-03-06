/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;
import entities.AuthorDocument;
import entities.AuthorDocument;
import entities.Document;
import entities.Document;
import entities.MongoContext;
import org.bson.types.ObjectId;
import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.query.Query;

/**
 *
 * @author Hoang Hiep
 */
public class AuthorDocumentDAO {

    public static String createAuthorDocument(AuthorDocument authorDocument) {
        Datastore ds = MongoContext.getDatastore();
        return String.valueOf(ds.save(authorDocument));
    }

    public static void deleteAuthorDocument(ObjectId documentID) {
        Datastore ds = MongoContext.getDatastore();
        final Query<AuthorDocument> row = ds.createQuery(AuthorDocument.class)
                .filter("documentID", documentID);
        ds.delete(row);
    }
    
    
    public static boolean checkDocumentByUserID(String documentID, String userID){
        Datastore ds = MongoContext.getDatastore();
        AuthorDocument authorDocument = ds.find(AuthorDocument.class).filter("fromUserID", new ObjectId(userID)).filter("documentID", new ObjectId(documentID)).get();
        
        if(authorDocument!=null)return true;
        return false;
    }
    public static ArrayList<Document> findDocumentByAuthorUserId(String fromUserID) {
        ArrayList<AuthorDocument> arr = new ArrayList<AuthorDocument>();
        Datastore ds = MongoContext.getDatastore();
        arr = (ArrayList<AuthorDocument>) ds.find(AuthorDocument.class).filter("fromUserID", new ObjectId(fromUserID)).asList();

        ArrayList<Document> arrDocument = new ArrayList<Document>();
        for (AuthorDocument ad : arr) {
            Document currentDocument = ds.find(Document.class).filter("_id", (ObjectId)ad.getDocumentID()).get();
            arrDocument.add(currentDocument);
        }
        return arrDocument;
    }
    
   
    public static int countDocumentByUserId(String fromUserID) {
        ArrayList<AuthorDocument> arr = new ArrayList<AuthorDocument>();
        Datastore ds = MongoContext.getDatastore();
        arr = (ArrayList<AuthorDocument>) ds.find(AuthorDocument.class).filter("fromUserID", new ObjectId(fromUserID)).asList();
        return arr.size();
    }
}
