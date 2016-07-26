/**
 * Complete Guide to Node Authentication with MySQL
 * Source: https://github.com/manjeshpv/node-express-passport-mysql.git
 */

var express = require('express');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var morgan = require('morgan');
var app = express();
var port = process.env.PORT || 8080;
var passport = require('passport');
var flash = require('connect-flash');

require('./config/passport')(passport);

app.use(morgan('dev')); // log every request to the console
app.use(cookieParser()); // read cookies (needed for auth)
app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json());

app.set('view engine', 'ejs');

app.use(session({
    secret: 'gtonline2016secretsession',
    resave: true,
    saveUninitialized: true
}));

app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(flash()); // use connect-flash for flash messages stored in session

// Defining links
var linksMap = new Map();
linksMap.set('Movies Now Playing', '/plays/at');
linksMap.set('My Profile', '/profile');
linksMap.set('My Order History', '/my/history');
linksMap.set('My Payment', '/pref/card');
linksMap.set('My Preferred Theathers', '/pref/theater');
linksMap.set('Logout', '/logout');

var linksManager = new Map();
linksManager.set('My Profile', '/profile');
linksManager.set('View Revenue Report', '/manager/options/revenue');
linksManager.set('View Popular Movie Report', '/manager/options/popular');
linksManager.set('Logout', '/logout');

require('./config/passportroutes.js')(app, passport, linksMap, linksManager);
require('./config/playingAt.js')(app, linksMap, linksManager);
require('./config/managerRoutes.js')(app, linksManager);
//middleware: if user isn't logged in, they are redirected to login page
//ordering matters! This has to come after passport authentication
app.use(
    function (req, res, next) {
        if (req.isAuthenticated())
            return next();
        res.redirect('/');
    });

//your routes goes here
require('./config/reviewroutes.js')(app, linksMap);
require('./config/preTheater.js')(app, linksMap);
require('./config/preCard.js')(app, linksMap);
require('./config/orderRoutes.js')(app, linksMap);

app.listen(port);
console.log('If not automatically loaded, Please go to port ' + port);

var open = require('open');
open('http://localhost:'+ port);

