Feature: Creación de mascota

  @create_successful_pet
  Scenario Outline: Crear Mascota

    * url baseUrl
    * def petRequest =
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
    And request petRequest
    When method POST
    Then status 200
    And match response.id == <id>
    And match response.name == "<name>"

    Examples:
      | read('classpath:data/crear_mascota.csv') |



