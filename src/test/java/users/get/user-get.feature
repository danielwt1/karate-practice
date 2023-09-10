
Feature: Get user on reqres
  #Algo generico que hara el scenario como titulo
  #Tiene que ser especifico de que trata el test o que hara, para que sepa de que trata
  Scenario: Get a user
    #describe contexto del escenario el (DADO QUE.....)
    # url palabra clave que le dice a karate la url
    Given url "https://reqres.in" +"/api/users/"+"2"
    # le especifico que va a pasar cuando haga algun metodo get, post,put, etc
    When method get

    ##Lo esperado le digo que estoy esperando al hacer el when
    Then status 200

  Scenario: Get Users
    #Creo variable para traer el archivo json y luego compararlo
    * def jsonUsers = read("../json/users.json")

    Given url "https://reqres.in/api/users?page=1"
    When method get
    Then status 200
    #Mejorar validaciones si viene paginada la api
    # se recomienda usar match yua que es mas inteligente
    # mapoeo el json con $.nombre Key pero si dejo todo el $ toda todo el JSON
    And match $ == jsonUsers