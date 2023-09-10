#Todas las palabras de gherkin se pueden usar
Feature: Delete user
  Scenario: Delete use
    #Le digo la ruta y al final lo acompaño con la etiqueta que le coloque
    * call read("../post/user-post-snippets.feature@Create")
    # Y aca púedo usar en lugar del ID estatico el que trae de la prueba exportada
    Given url "https://reqres.in/api/users/contactId"
    When method delete
    Then status 204

