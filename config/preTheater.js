/**
 * Shows a list of selected theaters
 */

var mysql = require('mysql');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
connection.query('USE ' + dbconfig.database);
//fs = require('fs');

module.exports = function (app, linksMap) {

    /**
     * Renders list of preferred theaters.
     */
    app.get('/pref/theater', function (req, res) {
        connection.query('SELECT T.Theater_ID, T.Name, T.Street, T.City, T.State, T.Zip ' +
            'FROM THEATER T, PREFERS P ' +
            'WHERE T.Theater_ID = P.Theater_ID AND P.Username = ?', req.user.Username,
            function (err, rows, fields) {
                if (err) {
                    console.log(err);
                }
                theaterObject = [];
                rows.forEach(function (row) {
                    theaterObject.push({
                        id: row.Theater_ID,
                        name: row.Name,
                        street: row.Street,
                        city: row.City,
                        state: row.State,
                        zip: row.Zip
                    });
                });
                res.render('prefers/prefTheater.ejs', {
                    user: req.user,
                    message: req.flash("userMessage"),
                    theater: theaterObject,
                    myMap: linksMap
                });
            }
        );
    });

    /**
     * Creates a new prefers.
     */
    app.get('/create/pref/theater/:theaterID', function (req, res) {
        var theatID = req.params.theaterID.replace(":", '');
        connection.query('INSERT INTO PREFERS VALUES(?,?)',
            [theatID, req.user.Username], function (err, rows, fields) {
            return res.json(theatID);
        });
    });

    /**
     * Deletes from prefers.
     */
    app.get('/pref/theater/delete/:id', function (req, res) {
        var id = req.params.id.replace(":", '');
        connection.query("DELETE FROM PREFERS WHERE Theater_Id = ?", id, function (err, rows, fields) {
            if (err) {
                console.log(err);
            }
        });
        req.flash("userMessage", "Successfully Deleted");
        res.redirect('/pref/theater');
    });

    /**
     * Gets list of preferred theaters.
     */
    app.get('/pref/theaters', function (req, res) {
        connection.query('SELECT T.Theater_ID, T.Name, T.Street, T.City, T.State, T.Zip ' +
            'FROM THEATER T, PREFERS P ' +
            'WHERE T.Theater_ID = P.Theater_ID AND P.Username = ?', req.user.Username,
            function (err, rows, fields) {
                if (err) {
                    console.log(err);
                }
                theaterObject = [];
                rows.forEach(function (row) {
                    theaterObject.push({
                        theaterID: row.Theater_ID,
                        theaterName: row.Name,
                        street: row.Street,
                        city: +row.City,
                        state: row.State,
                        zip: row.Zip
                    });
                });
                //fs.writeFile('json/myTheaters.json', JSON.stringify(theaterObject));
                return res.json(theaterObject);
            }
        );
    });

    /**
     * Searches for theaters.
     */
    app.get('/search/theaters/:searchTerm/:searchBy', function (req, res) {
        var searchTerm = req.params.searchTerm.replace(':', '');
        var searchBy = req.params.searchBy.replace(':', '');
        connection.query('SELECT * FROM THEATER WHERE ' + searchBy + ' LIKE ?', '%' + searchTerm + '%',
            function (err, rows, fields) {
                if (err) {
                    console.log(err);
                }
                theaterObject = [];
                rows.forEach(function (row) {
                    theaterObject.push({
                        theaterID: row.Theater_ID,
                        theaterName: row.Name,
                        street: row.Street,
                        city: +row.City,
                        state: row.State,
                        zip: row.Zip
                    });
                });
                //fs.writeFile('json/myTheaters.json', JSON.stringify(theaterObject));
                return res.json(theaterObject);
            }
        );
    });
};
