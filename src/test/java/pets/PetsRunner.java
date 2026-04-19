package pets;

import com.intuit.karate.junit5.Karate;

public class PetsRunner {

    @Karate.Test
    Karate testCreatePet() {
        return Karate.run("classpath:features/createPet");
    }

    @Karate.Test
    Karate testGetPet() {
        return Karate.run("classpath:features/getPet");
    }

    @Karate.Test
    Karate testUpdatePet() {
        return Karate.run("classpath:features/updatePet");
    }

    @Karate.Test
    Karate testFindByStatus() {
        return Karate.run("classpath:features/getStatus");
    }

  
}

