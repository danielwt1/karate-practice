package users.get;

import com.intuit.karate.junit5.Karate;
// Es un runner para coger y solo correr lo que realmente quiero correr y no todo
public class userGetRunner {
    //
    @Karate.Test
    Karate userGet(){
        //le paso solo el nombre sin el feature
        //si tengo mas de 1 (.feature) que quiero correr dejo vacio el run()
        return Karate.run().relativeTo(getClass());
    }
}
