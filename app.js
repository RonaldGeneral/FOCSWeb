const express = require('express')
const expressLayouts = require('express-ejs-layouts')

const app = express()
const port = 3000
const db = require('./db');

// Test the database connection when your app starts
db.testConnection()
  .then(() => {
    console.log('Database connection successful');
    startServer();
  })
  .catch(error => {
    console.error('Database connection failed:', error);
    process.exit(1);
  });

// Example usage in an Express route
 app.get('/programme', async (req, res) => {
  try {
    const programme = await db.getAllRecords('programme'); 
    res.json(programme);
  } catch (error) {
    res.status(500).json({ error: 'An error occurred while fetching programme' });
  }
});

app.use(express.static(__dirname + '/public'));

app.use(expressLayouts)
app.set('layout', './layouts/layout')
app.set('view engine', 'ejs')

app.get('/', (req, res) => {
  res.render('home');
});

app.get('/req', (req, res) => {
  res.render('require_checker');
});

app.get('/course', (req, res) => {
  res.render('course');
});

function startServer() {
  app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
  });
}
