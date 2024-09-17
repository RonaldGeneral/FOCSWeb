const db = require('./db');

exports.getAvailableProgrammes = async function(data) {
    try {
      const rows = await db.query(`
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
    } catch (error) {
      console.error('Error fetching available programmes:', error);
      throw error;
    }
  }
  
  function checkProgrammeRequirements(programme, data) {
    const { lowQual, highQual, fqua, fhighqua, fpostqua, fenglishqua, englishProficiency,postGraduate } = data;
    
    // Check SPM requirements
    if(lowQual){
      if(fqua == "M"){
        if (programme.SPMNo && programme.SPMGrade) {
          const spmSubjects = lowQual.filter(subject => subject.grade.charAt(0) <= programme.SPMGrade);
          if (spmSubjects.length < programme.SPMNo) return false;
          
          // Check for Mathematics and English requirements
          const mathSubject = lowQual.find(subject => subject.subject.toLowerCase().includes('mathematics'));
          const englishSubject = lowQual.find(subject => subject.subject.toLowerCase().includes('ingerris'));
          if (!mathSubject || mathSubject.grade.charAt(0) > 'C' || !englishSubject || englishSubject.grade.charAt(0) > 'D') return false;
        }
      }
      
      else{
        // Check O Level requirements
        if (programme.OLevelNo && programme.OLevelGrade) {
          const oLevelSubjects = lowQual.filter(subject => subject.grade.charAt(0) <= programme.OLevelGrade);
          if (oLevelSubjects.length < programme.OLevelNo) return false;
          
          // Check for Mathematics and English requirements
          const mathSubject = oLevelSubjects.find(subject => subject.subject.toLowerCase().includes('mathematics'));
          const englishSubject = oLevelSubjects.find(subject => subject.subject.toLowerCase().includes('english'));
          if (!mathSubject || mathSubject.grade.charAt(0) > 'C' || !englishSubject || englishSubject.grade.charAt(0) > 'E') return false;
        }
      }
    }
    
    if(highQual){
      // Check UEC requirements
      if(fhighqua == "UE"){
        if (programme.UECNo && programme.UECGrade) {
          const uecSubjects = highQual.filter(subject => subject.grade.charAt(0) <= programme.UECGrade);
          if (uecSubjects.length < programme.UECNo) return false;
          
          // Check for Mathematics and English requirements
          const mathSubject = uecSubjects.find(subject => subject.subject.toLowerCase().includes('mathematics'));
          const englishSubject = uecSubjects.find(subject => subject.subject.toLowerCase().includes('english'));
          if (!mathSubject || mathSubject.grade.charAt(0) > 'B' || !englishSubject || englishSubject.grade.charAt(0) > 'C') return false;
        }
      }
      
      
      // Check STPM requirements
      if(fhighqua == "ST"){
        if (programme.STPMNo && programme.STPMGrade) {
          const stpmSubjects = highQual.filter(subject => subject.grade.charAt(0) <= programme.STPMGrade);
          if (stpmSubjects.length < programme.STPMNo) return false;
          
          // Check for Mathematics and English requirements
          if(spmSubjects){
            const mathSubject = spmSubjects.find(subject => subject.subject.toLowerCase().includes('mathematics'));
            const englishSubject = spmSubjects.find(subject => subject.subject.toLowerCase().includes('ingerris'));
            if (!mathSubject || mathSubject.grade.charAt(0) > 'C' || !englishSubject || englishSubject.grade.charAt(0) > 'D') return false;
          }
          else{
            return false;
          }
          
        }
      }
      
      // Check A Level requirements
      if(fhighqua == "AL"){
        if (programme.ALevelNo && programme.ALevelGrade) {
          const aLevelSubjects = highQual.filter(subject => subject.grade.charAt(0) <= programme.ALevelGrade);
          if (aLevelSubjects.length < programme.ALevelNo) return false;
          
          // Check for Mathematics and English requirements
          if(oLevelSubjects){
            const mathSubject = oLevelSubjects.find(subject => subject.subject.toLowerCase().includes('mathematics'));
            const englishSubject = oLevelSubjects.find(subject => subject.subject.toLowerCase().includes('english'));
            if (!mathSubject || mathSubject.grade.charAt(0) > 'C' || !englishSubject || englishSubject.grade.charAt(0) > 'E') return false;
          }
          else{
            return false;
          }
          
        }
      }
    }
    
    if (fpostqua) {
      // Check CGPA and work experience requirements
      if (postGraduate) {
        const programmeID = programme.ProgrammeID;
        const hasComputingMathBachelor = postGraduate.hasComputingMathBachelor;
        const studyEnglish = postGraduate.studyEnglish;
        const cgpa = postGraduate.cgpa;
        const workExperience = postGraduate.workExperience;

        if (programmeID == 12 || programmeID == 13) {
          const minCGPA = hasComputingMathBachelor ? 2 : 2.5;
          if (cgpa < minCGPA) return false;
          if (!studyEnglish && englishProficiency) {
            if (fenglishqua == "MU" && englishProficiency.band < 4.0) return false;
            if (fenglishqua == "IE" && englishProficiency.bandScore < 5.5) return false;
            if (fenglishqua == "TP" && englishProficiency.score < 46) return false;
          }
        } else if (programmeID == 14) {
          const minCGPA = hasComputingMathBachelor ? 2.5 : 2.75;
          if (cgpa < minCGPA && workExperience < 5) return false;
          if (!studyEnglish && englishProficiency) {
            if (fenglishqua == "MU" && englishProficiency.band < 3.5) return false;
            if (fenglishqua == "IE" && englishProficiency.bandScore < 5.0) return false;
            if (fenglishqua == "TP" && englishProficiency.score < 40) return false;
          }
        } else if (programmeID == 15 || programmeID == 16) {
          if (!hasComputingMathBachelor && workExperience < 5) return false;
          if (!studyEnglish && englishProficiency) {
            if (fenglishqua == "MU" && englishProficiency.band < 4.0) return false;
            if (fenglishqua == "IE" && englishProficiency.bandScore < 6.0) return false;
            if (fenglishqua == "TP" && englishProficiency.score < 60) return false;
          }
        } else if (programmeID == 17) {
          if (!hasComputingMathBachelor) return false;
          if (!studyEnglish && englishProficiency) {
            if (fenglishqua == "MU" && englishProficiency.band < 3.5) return false;
            if (fenglishqua == "IE" && englishProficiency.bandScore < 5.0) return false;
            if (fenglishqua == "TP" && englishProficiency.score < 40) return false;
          }
        }
      }
      
    }
    
    // check if not provide any low qualification
    if (programme.SPMNo && programme.SPMGrade && programme.OLevelNo && programme.OLevelGrade && !lowQual){
        return false;
    }
    // check if not provide any high qualification
    if (programme.UECNo && programme.UECGrade && programme.STPMNo && programme.STPMGrade && !highQual){
      return false;
    }
    if(!programme.UECNo && !programme.UECGrade && !postGraduate){
      return false;
    }

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