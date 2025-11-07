@createUser
Feature: Crear un usuario Casos Negativos

  Background:
    * url api.mainUrl
    * header api-key = apiKey

@createUserNegative
Scenario: No se puede crear usuario si el campo 'email' está ausente
* def requestBody = read('classpath:user_create_payload.json')
* set requestBody.id = userID
* remove requestBody.email

Given path '/user'
And request requestBody
When method post
  Then status 200
  And match response.code == 200
  And match response.message == "26"