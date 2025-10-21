@getUser
Feature: Obtener usuario por username

  Background:
    * url api.mainUrl
    * header api-key = apiKey

  @happyPath
  Scenario: Un cliente puede obtener los datos de un usuario por username
    * call read('createUser.feature@happyPath')
    Given path '/user/', userName
    When method get
    Then status 200
    And match response.id == userID
    And match response.firstName contains '#notnull'
    * print 'Usuario encontrado con el id: ', userID
