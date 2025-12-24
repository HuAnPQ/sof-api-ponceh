@countries @restcountries
Feature: Obtener y validar datos de países por nombre

  Background:
    * url 'https://restcountries.com/v3.1'

    @getCountriesByName
  Scenario Outline: Validar datos generales del País - <nombre>
    Given path 'name', '<pais_path>'
    When method get
    Then status 200

    And match response[0].name.common == '<nombre>'
    And match response[0].capital contains '<capital_esperada>'
    And match response[0].continents contains '<continente>'
    * def languages = response[0].languages
    And match languages['<lang_key>'] == '<lang>'

    * print 'Validación exitosa del País - ', nombre
    Examples:
      | read('classpath:paises.csv') |