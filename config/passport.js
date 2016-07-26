/**
 * Complete Guide to Node Authentication with MySQL
 * Source: https://github.com/manjeshpv/node-express-passport-mysql.git
 * Makes queries and checks for login/registration.
 */

var LocalStrategy = require('passport-local').Strategy;

var mysql = require('mysql');
var bcrypt = require('bcrypt-nodejs');

var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
connection.query('USE ' + dbconfig.database);

module.exports = function (passport) {

    passport.serializeUser(function (user, done) {
        done(null, user);
    });

    passport.deserializeUser(function (user, done) {
        connection.query("SELECT * FROM user WHERE Username = ?",
            [user.Username], function (err, rows) {
                done(err, rows[0]);
            });
    });

    //signup
    passport.use(
        'local-signup',
        new LocalStrategy({
                usernameField: 'username',
                passwordField: 'password',
                passReqToCallback: true
            },
            function (req, username, password, done) {
                connection.query("SELECT * FROM USER WHERE Username = ?", [username], function (err, rows) {
                    if (err)
                        return done(err);
                    if (rows.length) {
                        return done(null, false, req.flash('userMessage', 'That username already exists.'));
                    } else if (req.body.manpass !== "") {
                        connection.query("SELECT * FROM SYSTEM_INFO", function (err, rows) {
                            if (!bcrypt.compareSync(req.body.manpass, rows[0].Man_Pass)) {
                                return done(null, false, req.flash('userMessage', 'Manager password is incorrect.'));
                            }
                            var newUserMysql = {
                                Username: username,
                                Password: bcrypt.hashSync(password, null, null),
                                Email: req.body.email,
                                User_Type: 1
                            };
                            var insertQuery = "INSERT INTO user (Username, Password, Email, User_Type) values (?,?,?,?)";
                            connection.query(insertQuery, [newUserMysql.Username,
                                newUserMysql.Password, newUserMysql.Email,
                                newUserMysql.User_Type], function (err, rows) {
                                if (err) {
                                    return done(null, false, req.flash('userMessage', 'That email is already exists.'));
                                }
                                newUserMysql.id = rows.insertId;
                                return done(null, newUserMysql);
                            });
                        })
                    } else {
                        var newUserMysql = {
                            Username: username,
                            Password: bcrypt.hashSync(password, null, null),
                            Email: req.body.email,
                            User_Type: 0
                        };
                        var insertQuery = "INSERT INTO user (Username, Password, Email, User_Type) values (?,?,?,?)";
                        connection.query(insertQuery, [newUserMysql.Username,
                            newUserMysql.Password, newUserMysql.Email,
                            newUserMysql.User_Type], function (err, rows) {
                            if (err) {
                                return done(null, false, req.flash('userMessage', 'That email is already taken.'));
                            }
                            newUserMysql.id = rows.insertId;
                            return done(null, newUserMysql);
                        });
                    }
                });
            })
    );

    //login
    passport.use(
        'local-login',
        new LocalStrategy({
                usernameField: 'username',
                passwordField: 'password',
                passReqToCallback: true
            },
            function (req, username, password, done) {
                connection.query("SELECT * FROM USER WHERE Username = ?", [username], function (err, rows) {
                    if (err)
                        return done(err);
                    if (!rows.length) {
                        return done(null, false, req.flash('userMessage', 'No user found.'));
                    }
                    if (!bcrypt.compareSync(password, rows[0].Password)) {
                        return done(null, false, req.flash('userMessage', 'Oops! Wrong password.'));
                    }
                    return done(null, rows[0]);
                });
            })
    );
};
