@createUser
Feature: Crear un usuario Casos Negativos

  Background:
    * url api.mainUrl
    * header api-key = apiKey

@createUserNegative
Scenario: El endpoint no debe permitir el método GET
Given path '/user'
When method get
Then status 405