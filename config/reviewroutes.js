/**
 * module for review routes
 * Routes relating to creating a review.
 * Due to time constraint of this project, we will include logic and routing in one file.
 */

var mysql = require('mysql');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
connection.query('USE ' + dbconfig.database);

module.exports = function (app, linksMap) {
    /**
     * Renders review form.
     */
    app.get('/review/:movieTitle', function (req, res) {
        var movieTitle = req.params.movieTitle.replace(":", "");
        res.render('review/reviewform.ejs', {
            user: req.user,
            message: req.flash('userMessage'),
            messageSuccess: req.flash('userSuccess'),
            myMap: linksMap,
            movieTitle: movieTitle
        });
    });

    /**
     * Renders list of reviews of a movie.
     */
    app.get('/review/list/:movieTitle', function (req, res) {
        var movieTitle = req.params.movieTitle.replace(":", "");
        var canReview = false;
        connection.query("SELECT * FROM REVIEW WHERE Movie_Title = ?", movieTitle, function (err, rows, fields) {
            if (err) {
                console.log(err);
            }
            else {
                reviewsObject = [];
                rows.forEach(function (row) {
                    reviewsObject.push({
                        title: row.Title, username: row.Username, comment: row.Comment,
                        movie: row.Movie_Title, rating: row.Rating
                    });
                });
                connection.query("SELECT * FROM ORDER_ITEMS " +
                    "WHERE Status = 2 AND Movie_Title = ? AND Username = ?", [movieTitle, req.user.Username],
                    function (err, rows, fields) {
                        if (err) {
                            console.log(err)
                        }
                        if (rows.length) {
                            canReview = true;
                        }
                        return res.render('review/reviewsList.ejs', {
                            reviews: reviewsObject,
                            myMap: linksMap,
                            movie: movieTitle,
                            reviewBool: canReview
                        })
                    })
            }
        })
    });

    /**
     * Posts a new review.
     */
    app.post('/review/:movieTitle', function (req, res) {
        var movieTitle = req.params.movieTitle.replace(":", "");
        var insertQuery = "INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating) VALUES (?,?,?,?,?)";
        connection.query(insertQuery,
            [req.body.reviewTitle, req.body.reviewTA, req.user.Username, movieTitle, req.body.rating],
            function (err, rows) {
            if (err) {
                req.flash('userMessage', "You cannot review twice.");
                res.redirect('/review/:' + movieTitle);
            } else if (req.body.reviewTitle === "") {
                req.flash('userMessage', 'Title is required. Please teview form.');
                res.redirect('/review/:' + movieTitle);
            } else {
                req.flash('userSuccess', 'Your review was processed!');
                res.redirect('/review/:' + movieTitle);
            }
        });
    });
};