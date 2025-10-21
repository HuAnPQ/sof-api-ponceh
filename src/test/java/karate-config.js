function fn() {
    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000);

    var config = {
        api: {
            mainUrl: 'https://petstore.swagger.io/v2'
        },
        userID: 26,
        userName: "testhp"
    };

    var env = karate.env;
    karate.log('karate.env es: ', env);

    if (env === 'qa') {
        config.apiKey = 'qa-key';
    } else if (env === 'stg') {
        config.apiKey = 'stg-key';
    } else {
        config.apiKey = 'special-key';
    }

    return config;
}