var mysql = require('mysql');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
connection.query('USE ' + dbconfig.database);

module.exports = function (app, linksManager) {

    /**
     * Show most popular movies.
     */
    app.get('/manager/options/popular', function (req, res) {
        connection.query('SELECT * FROM POPULAR_MOVIES_FINAL',
            function (err, rows, fields) {
                if (err) {
                    console.log(err);
                }
                popularObject = [];
                rows.forEach(function (row) {
                    popularObject.push({
                        month: row.Month, title: row.Movie_Title, order: row.Total_Orders
                    });
                });
                res.render('manager/managerPopular.ejs', {
                    popular: popularObject, myMap: linksManager
                });
            });
    });

    /**
     * Gets revenue report.
     */
    app.get('/manager/options/revenue', function (req, res) {
        connection.query('SELECT * FROM REVENUE_VIEW',
            function (err, rows, fields) {
                if (err) {
                    console.log(err);
                }
                revenueObject = [];
                rows.forEach(function (row) {
                    revenueObject.push({
                        month: row.Month, revenue: row.Revenue
                    });
                });
                res.render('manager/managerRevenue.ejs', {
                    revenue: revenueObject, myMap: linksManager
                });
            });
    });
}