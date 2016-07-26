/**
 * Complete Guide to Node Authentication with MySQL
 * Source: https://github.com/manjeshpv/node-express-passport-mysql.git
 * This is the database connection setting we will use.
 * We will call it when we need it instead of writing it again and again.
 */

module.exports = {
    'connection': {
        'host': 'localhost',
        'user': 'root',
        'password': 'pass'
        //'host': 'us-cdbr-azure-east-c.cloudapp.net',
        //'user': 'b191a0a89d7979',
        //'password': 'dbc24f36'

        //'host': 'us-cdbr-azure-east-c.cloudapp.net',
        //'user': 'b56527fd0eb6a8',
        //'password': '501c7546'
    },
    'database': 'cs44002'
    //'database': 'acsm_6d0773e61278a18'
};