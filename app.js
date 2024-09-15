const express = require('express')
const expressLayouts = require('express-ejs-layouts')

const app = express()
const port = 3000

app.use(express.static(__dirname + '/public'));

app.use(expressLayouts)
app.set('layout', './layouts/layout')
app.set('view engine', 'ejs')

app.get('/', (req, res) => {
  res.render('home');
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});