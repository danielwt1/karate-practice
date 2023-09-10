Feature: Reusable scenarios for post a user
  #Est scenario es para reutilizarlo en otros scenarios, es decir crea y luego usa el otro scenario como un delete
  #Le colocamos una etuiqueta
  @Create
  Scenario: Create New User
    Given url "https://reqres.in/api/users"
    And request { "name": "morpheus", "job": "leader" }
    When method post
    Then status 201
    #Le digo que necesito un dato para el delete el ID que me da en el respionse
    And def contactId = $.id