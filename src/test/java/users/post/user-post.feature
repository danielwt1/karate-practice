Feature: Post user on reqres
  Scenario: Create New User
    Given url "https://reqres.in/api/users"
    ## si necesito enviar un body es con un And y request para decirle que necesito un request
    And request { "name": "morpheus", "job": "leader" }
    When method post

    Then status 201
