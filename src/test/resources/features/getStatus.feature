Feature: Busqueda por status

  Scenario Outline: Buscar mascota con status sold

    * url baseUrl
    * call read('updatePet.feature@update_succeful_pet')

    Given path 'pet', 'findByStatus'
    And param status = '<status>'
    When method GET
    Then status 200


    # Se valida que el estado devuelto sea correcto
    And match each response[*].status == '<status>'

    # Se valida que la mascota modificada se encuente en el responses
    And match response[*].id contains <id>


    Examples:
      | read('classpath:data/actualizar_mascota.csv') |
