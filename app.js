const express = require('express')
const expressLayouts = require('express-ejs-layouts')

const app = express()
const port = 3000
const db = require('./db');
const bodyParser = require('body-parser');
const elective = require('./elective');
const pr = require('./programme-require');
const ai = require('./ai');
const compareOutline = require('./compare_outline');
const compareData = require('./compare_data');

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
    const tarumtQual = subjectGradeData.tarumt;
    const englishProficiency = subjectGradeData.englishProficiency;
    const postGraduate = subjectGradeData.postGraduate;
   
    const data = {
      lowQual,
      highQual,
      fqua: formData.fqua,
      fhighqua: formData.fquahigh,
      fpostqua: formData.postQualification,
      fenglishqua: formData.fenglishQua,
      tarumtQual,
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

app.get('/compare', async (req, res) => {
  const { prog1, prog2 } = req.query;
  let selectedProg1 = prog1 ? parseInt(prog1) : null;
  let selectedProg2 = prog2 ? parseInt(prog2) : null;

  allProgs = await compareOutline.getAllProg();

  let prog1Data = null;
  let prog2Data = null;

  if (selectedProg1) {
    let compareData = await compareOutline.getCompare(selectedProg1);
    let courses = await compareOutline.getCourses(selectedProg1);
    let campuses = await compareOutline.getCampuses(selectedProg1);
    prog1Data = {
      ProgrammeName: compareData[0].ProgrammeName,
      Fees: compareData[0].Fees,
      Career: compareData[0].Career,
      progOutline: courses.map(c => c.CourseName),
      campus: campuses.map(c => c.BranchName)
    };
  }

  if (selectedProg2) {
    let compareData = await compareOutline.getCompare(selectedProg2);
    let courses = await compareOutline.getCourses(selectedProg2);
    let campuses = await compareOutline.getCampuses(selectedProg2);
    prog2Data = {
      ProgrammeName: compareData[0].ProgrammeName,
      Fees: compareData[0].Fees,
      Career: compareData[0].Career,
      progOutline: courses.map(c => c.CourseName),
      campus: campuses.map(c => c.BranchName)
    };
  }

  res.render('compare_programme', { 
    allProgs,
    selectedProg1, 
    selectedProg2, 
    prog1: prog1Data, 
    prog2: prog2Data 
  });
});

app.get('/elective', async (req, res) => {
    let progs = await elective.getProgElective();
    let egs, courses = [], selectedProg = 0, selectedEg = '';
    if(req.query && req.query.prog) {

        selectedProg = req.query.prog;
        egs = await elective.getElectiveGroup(selectedProg);

        if(req.query.group) {
            selectedEg = req.query.group;
            courses = await elective.getElectiveCourses(selectedEg, selectedProg);
            console.log(courses);

            for (let course of courses)  {
                if(!course.CourseDesc) {
                  course.CourseDesc = await ai.describeCourse(course.CourseName);
                  await elective.saveCourseDesc(course.CourseID, course.CourseDesc);
                }
                if(!course.Career) {
                  careersArray = await ai.listCareer(selectedProg.ProgrammeName, course.CourseName);
                  course.Career = careersArray.join('#');
                  await elective.saveCourseCareer(course.CourseID, careersArray);
                } 
            }
        }
    }
    
    res.render('elective', {progs, egs, selectedProg, selectedEg, courses});
});

function startServer() {
  app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
  });
}
