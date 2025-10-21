package api.petstore.user;

import com.intuit.karate.junit5.Karate;

public class UserRunner {

    @Karate.Test
    Karate UserRunnerTests(){
        return Karate.run()
                .relativeTo(getClass());
    }
}
