const db = require('./db');

exports.getProgElective = async function() {
    return db.query(
        `SELECT p.ProgrammeID, p.ProgrammeName
        FROM programme p
        INNER JOIN progcourse pc ON p.ProgrammeID = pc.ProgrammeID
        INNER JOIN electivegroup e ON pc.ID = e.ProgCourseID
        GROUP BY p.ProgrammeID;`
    );
};

exports.getElectiveGroup = async function(progid) {
    return db.query(
        `SELECT e.GroupCode, e.ProgCourseID
        FROM programme p
        INNER JOIN progcourse pc ON p.ProgrammeID = pc.ProgrammeID
        INNER JOIN electivegroup e ON pc.ID = e.ProgCourseID
        WHERE p.ProgrammeID = ?
        GROUP BY e.GroupCode;`, [progid]
    );
};

exports.getElectiveCourses = async function(code, progID) {
    return db.query(
        `SELECT c.*, ec.*
        FROM progcourse pc
        INNER JOIN electivegroup e ON e.ProgCourseID = pc.ID
        INNER JOIN electivecourse ec ON pc.CourseID = ec.ElectiveID  
        INNER JOIN course c ON pc.CourseID = c.CourseID
        WHERE e.GroupCode = ? AND pc.ProgrammeID = ?;`, [code, progID]
    );
};

exports.saveCourseDesc = async function(id, desc) {
    return db.query(
        `UPDATE course SET CourseDesc = ? WHERE course.CourseID = ?;`, [desc, id]
    );
};

exports.saveCourseCareer = async function(id, careersArray=[]) {
    careersStr = careersArray.join('#');

    return db.query(
        `UPDATE electivecourse SET Career = ? WHERE ElectiveID = ?;`, [careersStr, id]
    );
};