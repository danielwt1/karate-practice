Feature: Put user on reqres
  Scenario: Edit a exist User
    Given url "https://reqres.in/api/users/2"
    ## si necesito enviar un body es con un And y request para decirle que necesito un request
    And request { "name": "morpheus", "job": "zion resident" }
    When method patch

    Then status 200
