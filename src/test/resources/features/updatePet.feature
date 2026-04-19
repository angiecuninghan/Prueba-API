Feature: Actualizar mascota

  @update_succeful_pet
  Scenario Outline: Actualizar nombre y status de la mascota

    * url baseUrl
    #* def result = call read('createPet.feature@create_successful_pet')
    #* def petId = result.petId

    * def updatedPet =
    """
      {
        "id": <id>,
        "category": {
          "id": 0,
          "name": "string"
        },
        "name": "<name>",
        "photoUrls": [
          "string"
        ],
        "tags": [
          {
            "id": 0,
            "name": "string"
          }
        ],
        "status": "<status>"
      }
    """
    Given path 'pet'
    And request updatedPet
    When method PUT
    Then status 200
    And match response.id == <id>
    And match response.name == "<name>"
    And match response.status == "<status>"

    Examples:
      | read('classpath:data/actualizar_mascota.csv') |









