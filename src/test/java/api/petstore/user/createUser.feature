@createUser
Feature: Crear un usuario en la tienda

  Background:
    * url api.mainUrl
    * header api-key = apiKey
    * def requestCreateBody = read('classpath:user_create_payload.json')
    * set requestCreateBody.id = userID
    * set requestCreateBody.username = userName

  @happyPath
  Scenario: Un cliente puede crear exitosamente un usuario
    Given path '/user'
    And request requestCreateBody
    When method post
    Then status 200
    And match response.message contains '#notnull'
    And match response.code == 200
    And match response.message == userID.toString()

    * def userIdRes = response.message
    * print 'User creado con el ID: ', userIdRes
