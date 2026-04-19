function fn() {
  var env = karate.env;
  karate.log('karate.env system property was:', env);
  return {
  baseUrl : 'https://petstore.swagger.io/v2'
  };
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {

  } else if (env == 'e2e') {

  }
  return config;
}