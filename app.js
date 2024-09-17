const express = require('express')
const expressLayouts = require('express-ejs-layouts')

const app = express()
const port = 3000
const db = require('./db');
const bodyParser = require('body-parser');
const elective = require('./elective');
const pr = require('./programme-require');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static(__dirname + '/public'));

app.use(expressLayouts)
app.set('layout', './layouts/layout')
app.set('view engine', 'ejs')


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


 app.get('/programme', async (req, res) => {
  try {
    const programme = await db.getAllRecords('programme'); 
    res.json(programme);
  } catch (error) {
    res.status(500).json({ error: 'An error occurred while fetching programme' });
  }
});

app.post('/check-requirements', async (req, res) => {
  try {
    const formData = req.body;
    const subjectGradeData = JSON.parse(formData.subjectGradeData);

    // Separate low and high qualifications
    const lowQual = subjectGradeData.lowQual;
    const highQual = subjectGradeData.highQual;
    const englishProficiency = subjectGradeData.englishProficiency;
    const postGraduate = subjectGradeData.postGraduate;
   
    const data = {
      lowQual,
      highQual,
      fqua: formData.fqua,
      fhighqua: formData.fquahigh,
      fpostqua: formData.postQualification,
      fenglishqua: formData.fenglishQua,
      englishProficiency,
      postGraduate
    };

    const availableProgrammes = await pr.getAvailableProgrammes(data);

    res.render('available_prog', { programmes: availableProgrammes });
  } catch (error) {
    console.error('Error in /check-requirements:', error);
    res.status(500).json({ error: 'An error occurred while checking requirements' });
  }
});



app.get('/', (req, res) => {
  res.render('home');
});

app.get('/req', (req, res) => {
  res.render('require_checker');
});

app.get('/elective', async (req, res) => {
    let progs = await elective.getProgElective();
    let egs, courses = [], selectedProg = 0, selectedEg = '';
    if(req.query && req.query.prog) {

        selectedProg = req.query.prog;
        egs = await elective.getElectiveGroup(selectedProg);

        if(req.query.group) {
            selectedEg = req.query.group;
            courses = await elective.getElectiveCourses(selectedEg);
        }
    }
    
    res.render('elective', {progs, egs, selectedProg, selectedEg, courses});
});

function startServer() {
  app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
  });
}
