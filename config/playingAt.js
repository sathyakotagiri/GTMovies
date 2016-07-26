/**
 * Routes and logic for displaying movies playing now.
 */
var mysql = require('mysql');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
connection.query('USE ' + dbconfig.database);

module.exports = function (app, linksMap, linksManager) {

    /**
     * Gets a list of movies playing in theaters.
     */
    app.get('/plays/at', function (req, res) {
        connection.query('SELECT Plot_Summary, Title FROM MOVIE M ' +
            'WHERE Exists ' +
            '(SELECT * FROM PLAYS_AT P WHERE P.Movie_Title = M.Title AND P.Playing IS TRUE ORDER BY TITLE ASC)',
            function (err, rows, fields) {
                if (err) {
                    console.log(err);
                }
                movieObject = [];
                rows.forEach(function (row) {
                    var plot = row.Plot_Summary.substr(0, 65);
                    movieObject.push({title: row.Title, plot: plot + '...'});
                });
                if (!req.isAuthenticated()) {
                    linksMapNot = new Map();
                    linksMapNot.set('Movies Now Playing', '/plays/at');
                    linksMapNot.set('Login', '/');
                    myMapObj = linksMapNot;
                } else if (req.user.User_Type == 1) {
                    myMapObj = linksManager;
                } else {
                    myMapObj = linksMap;
                }
                res.render('playsAt/moviesList.ejs', {user: req.user, movies: movieObject, myMap: myMapObj});
            }
        );
    });

    /**
     * Gets movie page.
     */
    app.get('/plays/at/movie/:movieTitle', function (req, res) {
        var movie = req.params.movieTitle.replace(':', '');
        movieObject = [];
        connection.query('' +
            'SELECT ' +
            'M.Title, ' +
            'M.Genre, ' +
            'M.Length, ' +
            'M.Audience_Rating,' +
            ' M.Plot_Summary, ' +
            'M.Release_Date,' +
            ' M.Cast, ' +
            'AVG(Rating) as AVG' +
            ' FROM MOVIE M, REVIEW R, PLAYS_AT P ' +
            'WHERE M.Title = P.Movie_Title AND M.Title = ?', movie,
            function (err, rows, fields) {
                if (err) {
                    console.log(err);
                }
                if (!rows.length) {
                    console.log(err)
                }
                var rating = '';
                switch (rows[0].Audience_Rating) {
                    case 0:
                        rating = 'G';
                        break;
                    case 1:
                        rating = 'PG';
                        break;
                    case 2:
                        rating = 'PG-13';
                        break;
                    case 3:
                        rating = 'R';
                    case 4:
                        rating = 'NC-13'
                }
                var avg = rows[0].AVG.toString().substr(0, 3);
                var rd = rows[0].Release_Date.toString().substr(0, 15);
                movieObject.push({
                    title: rows[0].Title,
                    genre: rows[0].Genre,
                    length: rows[0].Length,
                    audRating: rating,
                    plot: rows[0].Plot_Summary,
                    releasedDate: rd,
                    cast: rows[0].Cast,
                    avgRating: avg
                });
                if (!req.isAuthenticated()) {
                    linksMapNot = new Map();
                    linksMapNot.set('Movies Now Playing', '/plays/at');
                    linksMapNot.set('Login', '/');
                    myMapObj = linksMapNot;
                } else {
                    myMapObj = linksMap;
                }
                res.render('playsAt/moviePage.ejs', {user: req.user, movies: movieObject, myMap: myMapObj});
            }
        );
    })
};