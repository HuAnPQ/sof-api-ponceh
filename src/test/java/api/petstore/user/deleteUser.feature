@deleteUser
Feature: Crear un usuario en la tienda

  Background:
    * url api.mainUrl
    * header api-key = apiKey
    * def userNameMOD = userName + "-mod"

  @happyPath
  Scenario: Un cliente puede crear exitosamente un usuario
    * call read('updateUser.feature@happyPath')
    Given path '/user/', userNameMOD
    When method delete
    Then status 200
    And match response.message contains '#notnull'
    And match response.code == 200
    And match response.message == userNameMOD

    * def userNameRes = response.message
    * print 'User eliminado con el userName: ', userNameRes
