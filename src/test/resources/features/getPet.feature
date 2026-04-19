Feature: Consultar Mascota

  Scenario Outline: Consultar mascota mediante ID

    * url baseUrl
    * call read('createPet.feature@create_successful_pet')


    Given path 'pet', <id>
    When method GET
    Then status 200
    And match response.id == <id>

    Examples:
      | read('classpath:data/crear_mascota.csv') |


