package model;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import entities.MongoContext;
import java.util.ArrayList;
import java.util.Date;
import entities.AuthorDocument;
import entities.Document;
import entities.User;
import org.bson.types.ObjectId;
import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.query.Query;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public static String insertUser(User user) {
        Datastore ds = MongoContext.getDatastore();
        user.setCreatedAt(new Date());
        return String.valueOf(ds.save(user));
    }
    
    public static void updatePassword(String userID, String newPassword){
        Datastore ds = MongoContext.getDatastore();
        Query query = ds.createQuery(User.class)
                .field("_id").equal(new ObjectId(userID));
        ds.update(query, ds.createUpdateOperations(User.class).set("password", newPassword));
    }

    public static String getUserId(String userName) {
        Datastore ds = MongoContext.getDatastore();
        User user = ds.find(User.class).filter("user_name", userName).get();
        return String.valueOf(user.getId());
    }
    
    public static String getUserName(String userID) {
        Datastore ds = MongoContext.getDatastore();
        User user = ds.find(User.class).filter("_id", new ObjectId(userID)).get();
        return String.valueOf(user.getUserName());
    }

    public static User login(String username, String password) {
        Datastore ds = MongoContext.getDatastore();
        User user = ds.find(User.class).filter("user_name", username).filter("password", password).get();

        return user;
    }
    
    public static User checkUser(String username) {
        Datastore ds = MongoContext.getDatastore();
        User user = ds.find(User.class).filter("user_name", username).get();

        return user;
    }
    
    public static String getPassword(String userID) {
        Datastore ds = MongoContext.getDatastore();
        User user = ds.find(User.class).filter("_id", new ObjectId(userID)).get();

        return user.getPassword();
    }

    public static User UserInfo(ObjectId userID) {
        Datastore ds = MongoContext.getDatastore();
        User user = ds.find(User.class).filter("_id", userID).get();

        return user;
    }

    public static ArrayList<User> showAllUser() {
        ArrayList arr = new ArrayList<User>();

        Datastore ds = MongoContext.getDatastore();
        //DBCollection colection = ds.getCollection(User.class);
        //DBCursor cursor = colection.find();
        arr = (ArrayList<User>) ds.find(User.class).asList();

        return arr;
    }
    
    public static ArrayList<User> findUserByUsername(String username){
        ArrayList<User> users = new ArrayList<User>();
        Datastore ds = MongoContext.getDatastore();
        users=(ArrayList) ds.createQuery(User.class).field("user_name").contains(username).asList();
        return users;
    }
    


    public static ArrayList<User> friendOfUser(String userID) {
        ArrayList<User> friendOfUsers = new ArrayList<>();
        ArrayList<User> users = UserDAO.showAllUser();
        for (User user : users) {
            ObjectId toUserID = user.getId();
            if (FriendDAO.checkIsFriend(new ObjectId(userID), toUserID) || FriendDAO.checkIsFriend(toUserID, new ObjectId(userID))) {
                friendOfUsers.add(user);
            }
        }
        return friendOfUsers;
    }

    public static User getUserAuthorByDocumentId(String documentId) {
        Datastore ds = MongoContext.getDatastore();
        AuthorDocument authorDocument = ds.find(AuthorDocument.class).filter("documentID", new ObjectId(documentId)).get();
        User user = ds.find(User.class).filter("_id", authorDocument.getFromUserID()).get();

        return user;
    }

    
}
