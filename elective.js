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
        `SELECT e.GroupCode
        FROM programme p
        INNER JOIN progcourse pc ON p.ProgrammeID = pc.ProgrammeID
        INNER JOIN electivegroup e ON pc.ID = e.ProgCourseID
        WHERE p.ProgrammeID = ?
        GROUP BY e.GroupCode;`, [progid]
    );
};

exports.getElectiveCourses = async function(code) {
    return db.query(
        `SELECT c.*, ec.*
        FROM progcourse pc
        INNER JOIN electivegroup e ON e.ProgCourseID = pc.ID
        INNER JOIN electivecourse ec ON pc.CourseID = ec.ElectiveID  
        INNER JOIN course c ON pc.CourseID = c.CourseID
        WHERE e.GroupCode = ?;`, [code]
    );
};