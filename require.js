async function getAvailableProgrammes(data) {
    const connection = await pool.getConnection();
    try {
      const [rows] = await connection.query(`
        SELECT p.ProgrammeID, p.ProgrammeName, p.StudyYear, r.*
        FROM programme p
        JOIN requirement r ON p.ReqID = r.ReqID
      `);
  
      const availableProgrammes = rows.filter(programme => {
        return checkProgrammeRequirements(programme, data);
      });
      return availableProgrammes.map(programme => ({
        ProgrammeName: programme.ProgrammeName,
        StudyYear: programme.StudyYear,
        requirements: formatRequirements(programme)
      }));
    } finally {
      connection.release();
    }
  }
  
  function checkProgrammeRequirements(programme, data) {
    const { lowQual, highQual, englishProficiency } = data;
    
    // Check SPM requirements
    if (programme.SPMNo && programme.SPMGrade) {
      const spmSubjects = lowQual.filter(subject => subject.grade <= programme.SPMGrade);
      if (spmSubjects.length < programme.SPMNo) return false;
      
      // Check for Mathematics and English requirements
      const mathSubject = spmSubjects.find(subject => subject.subject.toLowerCase().includes('mathematics'));
      const englishSubject = spmSubjects.find(subject => subject.subject.toLowerCase().includes('english'));
      if (!mathSubject || mathSubject.grade > 'C' || !englishSubject || englishSubject.grade > 'D') return false;
    }
    
    // Check O Level requirements
    if (programme.OLevelNo && programme.OLevelGrade) {
      const oLevelSubjects = lowQual.filter(subject => subject.grade <= programme.OLevelGrade);
      if (oLevelSubjects.length < programme.OLevelNo) return false;
      
      // Check for Mathematics and English requirements
      const mathSubject = oLevelSubjects.find(subject => subject.subject.toLowerCase().includes('mathematics'));
      const englishSubject = oLevelSubjects.find(subject => subject.subject.toLowerCase().includes('english'));
      if (!mathSubject || mathSubject.grade > 'C' || !englishSubject || englishSubject.grade > 'E') return false;
    }
    
    // Check UEC requirements
    if (programme.UECNo && programme.UECGrade) {
      const uecSubjects = highQual.filter(subject => subject.grade <= programme.UECGrade);
      if (uecSubjects.length < programme.UECNo) return false;
      
      // Check for Mathematics and English requirements
      const mathSubject = uecSubjects.find(subject => subject.subject.toLowerCase().includes('mathematics'));
      const englishSubject = uecSubjects.find(subject => subject.subject.toLowerCase().includes('english'));
      if (!mathSubject || mathSubject.grade > 'B' || !englishSubject || englishSubject.grade > 'C') return false;
    }
    
    // Add checks for STPM and A Level if needed
    
    return true;
  }
  
  function formatRequirements(programme) {
    const requirements = [];
    
    if (programme.SPMNo && programme.SPMGrade) {
      requirements.push({
        criteria: 'SPM',
        detail: `At least ${programme.SPMNo} subjects with grade ${programme.SPMGrade} or better, including Mathematics (C) and English (D)`
      });
    }
    
    if (programme.OLevelNo && programme.OLevelGrade) {
      requirements.push({
        criteria: 'O Level',
        detail: `At least ${programme.OLevelNo} subjects with grade ${programme.OLevelGrade} or better, including Mathematics (C) and English (E)`
      });
    }
    
    if (programme.UECNo && programme.UECGrade) {
      requirements.push({
        criteria: 'UEC',
        detail: `At least ${programme.UECNo} subjects with grade ${programme.UECGrade} or better, including Mathematics (B) and English (C)`
      });
    }
    
    // Add STPM and A Level requirements if needed
    
    return requirements;
  }