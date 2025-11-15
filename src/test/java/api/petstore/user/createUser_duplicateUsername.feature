@createUser
Feature: Crear un usuario Casos Negativos

  Background:
    * url api.mainUrl
    * header api-key = apiKey

@createUserNegative
Scenario: No se puede crear usuario si el 'username' ya existe
* call read('createUser.feature@happyPath')
* def existingUsername = userName

* def requestBody = read('classpath:user_create_payload.json')
* set requestBody.username = existingUsername

Given path '/user'
And request requestBody
When method post
Then status 400
And match response.message contains 'User already exists'