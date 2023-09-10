Feature: Post user on reqres

  #Le puedo especificar un BackGround para decirele que es lo que se reteria en cada escenario
  #Tambien puedo declarar variables
  Background:
    * url "https://reqres.in"
    * path "/api/users"
    #Pódria decile que tome el mismo request para cada ejecucion Por ejemplo con:
    #* request { "name": "morpheus", "job": "leader" }
    #Puedo guardar el valor en una vairable para usarla en algun caso
    * def requestVar = { "name": "ilegal", "job": "leader" }
    #Variable para los scenarios OutLine
    * def varForOutlineReq = { "name": "#(name)", "job": "#(role)" }
  Scenario: Create New User
    #Given url "https://reqres.in/api/users"
      # si necesito enviar un body es con un And y request para decirle que necesito un request
    Given request { "name": "morpheus", "job": "leader" }
    When method post

    Then status 201

  Scenario: Create With ilegal name
    #Y aca puedo usar la variable
    Given request requestVar
    When method post

    Then status 201
  Scenario: Create With another  name
    #Puedo crear una variable solo para este escenario
    * def RequestLocal = { "name": "ilegal", "job": "leader" }
    Given request RequestLocal
    When method post

    Then status 201

    #Scenario outline para decirle que escenarios usare
  Scenario Outline: Create User with Outline Scenario
    Given request varForOutlineReq
    When method post
    Then status 201
    # Se ejecuta el numero de datos para ingresar varios escenarios o varios usuarios en un escenario
    Examples:
    |name|role|
    |Daniel|Lider|
    |Pedro|dev|
    |Lucas|dev|
    |Juan|dev|
    |Brandon|dev|