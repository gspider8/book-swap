AWS.config.region = 'us-east-1'; // e.g., us-east-1

var poolData = {
    UserPoolId: 'us-east-1_NVVQncZem', // YOUR_USER_POOL_ID
    ClientId: '1jbno8rrrl7o0nvg4ots1fu4ht' // YOUR_APP_CLIENT_ID
};

var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);
