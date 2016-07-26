/**
 * Shows a list of selected cards.
 */

var mysql = require('mysql');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
connection.query('USE ' + dbconfig.database);

module.exports = function (app, linksMap) {
    /**
     * Gets cards that have been saved by the user.
     */
    app.get('/pref/card', function (req, res) {
        connection.query('SELECT Card_Num, Exp_Date, CH_Lname, CH_Fname, CVV ' +
            'FROM CARD_INFO WHERE SAVED = 1 AND Username = ?', req.user.Username,
            function (err, rows, fields) {
                if (err) {
                    console.log(err);
                }
                cardObject = [];
                rows.forEach(function (row) {
                    cardObject.push({
                        lName: row.CH_Lname,
                        fName: row.CH_Fname,
                        cardNo: row.Card_Num,
                        exp: row.Exp_Date,
                        cvv: row.CVV
                    });

                });
                res.render('prefers/prefCard.ejs', {
                    user: req.user,
                    card: cardObject,
                    myMap: linksMap,
                    message: req.flash("userMessage")
                });
            }
        );
    });

    /**
     * Marks cards as not saved.
     */
    app.get('/pref/card/delete/:cardNo', function (req, res) {
        var cardNo = req.params.cardNo.replace(':', '');
        connection.query("UPDATE CARD_INFO SET SAVED = 0 WHERE Card_Num = ?",
            cardNo, function (err, rows, fields) {
            if (err) {
                console.log(err);
            }
        });
        req.flash('userMessage', "Removed Successfully.");
        res.redirect('/pref/card');
    });

    /**
     * Gets cards that are saved
     */
    app.get('/my/cards', function (req, res) {
        connection.query('SELECT Card_Num, Exp_Date, CH_Lname, CH_Fname, CVV ' +
            'FROM CARD_INFO WHERE SAVED = 1 AND Username = ?', req.user.Username,
            function (err, rows, fields) {
                if (err) {
                    console.log(err);
                }
                cardObject = [];
                rows.forEach(function (row) {
                    cardObject.push({cardNo: row.Card_Num});
                });
                return res.json(cardObject);
            }
        );
    });

    /**
     * Check that card num is unique.
     */
    app.get('/check/card/unique/:cardNo', function (req, res) {
        var Card_Num = req.params.cardNo.replace(':', '');
        connection.query("SELECT Card_Num FROM CARD_INFO WHERE Card_Num = ?",
            Card_Num, function (err, rows, fields) {
            if (rows.length) {
                return res.send("err");
            } else {
                return res.send(Card_Num)
            }
        });
    });

    /**
     * Saves a new card card.
     */
    app.post('/add/card/:cardNo/:expDate/:lastN/:firstN/:cvv/:save', function (req, res) {
        var Card_Num = req.params.cardNo.replace(':', '');
        var expDate = req.params.expDate.replace(':', '');
        var lastN = req.params.lastN.replace(':', '');
        var firstN = req.params.firstN.replace(':', '');
        var cvv = req.params.cvv.replace(':', '');
        var save = req.params.save.replace(':', '');
        var saveBool = false;
        if (save == "true") {
            saveBool = true;
        }
        var insertQuery = "INSERT INTO CARD_INFO " +
            "(Card_Num, Exp_Date, CH_Lname, CH_Fname, Username, CVV, Saved) " +
            "VALUES (?,?,?,?,?,?,?)";
        connection.query(insertQuery, [Card_Num, expDate, lastN, firstN, req.user.Username, cvv, saveBool],
            function (err, rows, fields) {
                if (err) {
                    return res.send("err");
                } else {
                    return res.send(Card_Num);
                }
            }
        );
    });
};
