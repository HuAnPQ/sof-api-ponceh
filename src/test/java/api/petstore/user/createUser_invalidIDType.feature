@createUser
Feature: Crear un usuario Casos Negativos

  Background:
    * url api.mainUrl
    * header api-key = apiKey

@createUserNegative
Scenario: No se puede crear usuario con un ID de tipo String
* def requestBody = read('classpath:user_create_payload.json')
* set requestBody.id = "26User06"
* set requestBody.username = userName

Given path '/user'
And request requestBody
When method post
Then status 500
And match response.message contains 'something bad'