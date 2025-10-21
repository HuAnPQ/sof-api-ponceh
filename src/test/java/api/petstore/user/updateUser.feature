@updateUser
Feature: Actualizar datos de un usuario en la tienda

  Background:
    * url api.mainUrl
    * header api-key = apiKey
    * def requestCreateBody = read('classpath:user_create_payload.json')
    * set requestCreateBody.id = userID
    * def userNameMOD = userName + "-mod"
    * set requestCreateBody.username = userNameMOD
    * set requestCreateBody.email = "test-mod@hp.dev"

  @happyPath
  Scenario: Un cliente puede crear exitosamente un usuario
    Given path '/user/', userName
    And request requestCreateBody
    When method put
    Then status 200
    And match response.message contains '#notnull'
    And match response.code == 200
    And match response.message == userID.toString()

    * def userIdRes = response.message
    * print 'User actualizado con el ID: ', userIdRes

  @happyPathGetMod
  Scenario: Un cliente puede obtener los datos de un usuario modificado por username
    Given path '/user/', userNameMOD
    When method get
    Then status 200
    And match response.id == userID
    And match response.firstName contains '#notnull'
    * print 'Usuario modificado encontrado con el id: ', userID

