/**
 * For creating orders.
 */
var mysql = require('mysql');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
connection.query('USE ' + dbconfig.database);

module.exports = function (app, linksMap) {

    /**
     *  Renders the order page.
     */
    app.get('/order/:movieTitle', function (req, res) {
        var movie = req.params.movieTitle.replace(':', '');
        res.render("orders/orderTicket.ejs", {user: req.user, myMap: linksMap, movie: movie});
    });

    /**
     * Gets the order history.
     */
    app.get('/my/history', function (req, res) {
        var queryStm = "SELECT O.Total_Price, O.Status, O.Order_ID, O.Adult_Tickets," + 
        "O.Child_Tickets, O.Senior_Tickets, M.Title, M.Audience_Rating, M.Length, O.Show_Time," + 
        "T.Theater_ID, T.Street, T.State, T.Zip FROM ORDER_ITEMS O, THEATER T," + 
        "MOVIE M WHERE O.Movie_Title = M.Title AND O.Theater_ID = T.Theater_ID AND O.Username = ?";
        connection.query(queryStm, req.user.Username, function (err, rows, fields) {
            if (err) {
                console.log(err);
            }
            orderObject = [];

            rows.forEach(function (row) {
                var rating = '';
                switch (row.Audience_Rating) {
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
                orderObject.push({
                    OTotalPrice: row.Total_Price, OOrderID: row.Order_ID, OAdultTickets: row.Adult_Tickets,
                    OChildTickets: row.Child_Tickets, OSeniorTickets: row.Senior_Tickets, OStatus: row.Status,
                    OShowTime: row.Show_Time, ODatePurch: row.Date_Purch,
                    MTitle: row.Title, MAudienceRating: rating, MLength: row.Length,
                    TTheaterID: row.Theater_ID, TStreet: row.Street, TState: row.State, Tzip: row.Zip,
                    TName: row.Name
                });
            });
            res.render('orders/ordersList.ejs', {
                user: req.user, ordersList: orderObject, myMap: linksMap,
                message: req.flash('userMessage')
            });
        });
    });

    /**
     * Cancels an order.
     */
    app.get('/order/cancel/:orderID/:total', function (req, res) {
        var refundPrice = 0;
        var canceledTotal = orderID = req.params.total.replace(":", "");
        var orderID = req.params.orderID.replace(":", "");
        connection.query("SELECT * FROM SYSTEM_INFO", function (err, rows, fields) {
            if (err) {
                console.log(err);
            } else {
                rows.forEach(function (row) {
                    refundPrice = row.Refund_Price;
                });
                canceledTotal = canceledTotal - refundPrice;
                connection.query("UPDATE ORDER_ITEMS SET STATUS = 1, Total_Price = ? " +
                    "WHERE Order_ID = ?", [canceledTotal, orderID], function (err, rows, fields) {
                    if (err) {
                        console.log(err);
                    }
                });
                req.flash('userMessage', "Removed Successfully.");
                res.redirect('/my/history');
            }
        });
    });

    /**
     * Shows the show times within 7 days.
     */
    app.get('/order/showtime/:movieTitle/:theaterId', function (req, res) {
        var movieTitle = req.params.movieTitle.replace(":", "");
        var theaterId = req.params.theaterId.replace(":", "");
        connection.query("SELECT Show_Time FROM SHOW_TIME " +
            "WHERE Show_Time BETWEEN NOW() AND NOW() + INTERVAL 7 DAY AND Movie_Title = ? AND Theater_ID = ?",
            [movieTitle, theaterId], function (err, rows, fields) {
            if (err) {
                console.log(err);
            }
            showTimeObject = [];
            rows.forEach(function (row) {
                showTimeObject.push({showTime: row.Show_Time});
            });
            return res.json(showTimeObject);
        });
    });

    /**
     * Gets price and discount info.
     */
    app.get('/order/subtotal/:adult/:senior/:children', function (req, res) {
        var adult = req.params.adult.replace(":", "");
        var senior = req.params.senior.replace(":", "");
        var children = req.params.children.replace(":", "");
        var adultPrice = 0;
        var seniorPrice = 0;
        var childrenPrice = 0;
        var total = 0;
        connection.query("SELECT * FROM SYSTEM_INFO", function (err, rows, fields) {
            if (err) {
                console.log(err);
            }
            rows.forEach(function (row) {
                adultPrice = adult * row.Ticket_Price;
                seniorPrice = senior * row.Ticket_Price * (1 - row.Senior_Disc);
                childrenPrice = children * row.Ticket_Price * (1 - row.Child_Disc);
            });
            total = adultPrice + seniorPrice + childrenPrice;
            return res.json(total);
        });
    });

    /**
     * Creates an order and returns the new orderID made.
     */
    app.post('/order/create/:theaterID/:movieTitle/:showTime/:totalPrice/:senior/:child/:adult/:cardNum',
        function (req, res) {
        var theaterID = req.params.theaterID.replace(":", "");
        var movieTitle = req.params.movieTitle.replace(":", "");
        var showTime = req.params.showTime.replace(":", "");
        var totalPrice = req.params.totalPrice.replace(":", "");
        var senior = req.params.senior.replace(":", "");
        var child = req.params.child.replace(":", "");
        var adult = req.params.adult.replace(":", "");
        var cardNo = req.params.cardNum.replace(":", "");
        var insertQ = "INSERT INTO ORDER_ITEMS " +
            "(Theater_ID, Movie_Title, Show_Time, Total_Price, Senior_Tickets, " +
            "Child_Tickets, Adult_Tickets, Card_Info, Username) VALUES (?,?,?,?,?,?,?,?,?)";
        var orderID = 0;
        connection.query(insertQ, [theaterID, movieTitle, showTime,
                totalPrice, senior, child, adult, cardNo, req.user.Username],
            function (err, rows, fields) {
                if (err) {
                    console.log("outer err" + err);
                } else {
                    connection.query("SELECT A.Order_ID FROM ORDER_ITEMS A " +
                        "WHERE A.Username = ? AND A.Date_Purch >= ALL " +
                        "(SELECT B.Date_Purch FROM ORDER_ITEMS B WHERE B.Username = ?)",
                        [req.user.Username, req.user.Username],
                        function (err, rows, fields) {
                            if (err) {
                                console.log("inner err" + err);
                            }
                            rows.forEach(function (row) {
                                orderID = row.Order_ID;
                            });
                            return res.json(orderID);
                        });
                }
            });
    });
};
