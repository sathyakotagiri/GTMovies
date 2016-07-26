/**
 * Complete Guide to Node Authentication with MySQL
 * Source: https://github.com/manjeshpv/node-express-passport-mysql.git
 * Routes related to signin/register/logout
 */

module.exports = function (app, passport, linksMap, linksManager) {

    /**
     * Gets default signin/reg page.
     */
    app.get('/', function (req, res) {
        res.render('index.ejs', {message: req.flash('userMessage')})
    });

    /**
     * Processes login
     */
    app.post('/login', passport.authenticate('local-login', {
            successRedirect: '/profile',
            failureRedirect: '/',
            failureFlash: true
        }),
        function (req, res) {
            if (req.body.remember) {
                req.session.cookie.maxAge = 1000 * 60 * 3;
            } else {
                req.session.cookie.expires = false;
            }
            res.redirect('/');
        }
    );

    /**
     * Processes registration.
     */
    app.post('/register', passport.authenticate('local-signup', {
        successRedirect: '/profile',
        failureRedirect: '/',
        failureFlash: true
    }));

    /**
     * Route to user's profile.
     */
    app.get('/profile', isLoggedIn, function (req, res) {
        if (req.user.User_Type == 0) {
            myMapObj = linksMap
        } else {
            myMapObj = linksManager
        }
        res.render('profile.ejs', {
            user: req.user, myMap: myMapObj
        });
    });

    /**
     * Log out of system.
     */
    app.get('/logout', function (req, res) {
        req.logout();
        res.redirect('/');
    });
};

// route middleware to make sure
function isLoggedIn(req, res, next) {
    // if user is authenticated in the session, carry on
    if (req.isAuthenticated())
        return next();
    // if they aren't redirect them to the home page
    res.redirect('/');
}