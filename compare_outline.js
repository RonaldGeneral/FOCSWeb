const db = require('./db');

exports.getAllProg = async function() {
    return db.query(
        `SELECT ProgrammeID, ProgrammeName
        FROM programme;`
    );
};

exports.getCompare = async function(progid) {
    return db.query(
        `SELECT p.ProgrammeName, 
                p.Fees, 
                p.Career
        FROM programme p
        WHERE p.ProgrammeID = ?;`, [progid]
    );
};

exports.getCourses = async function(progid) {
    return db.query(
        `SELECT c.CourseID, c.CourseName, c.CourseDesc, pc.Year
        FROM course c
        INNER JOIN progcourse pc ON c.CourseID = pc.CourseID
        WHERE pc.ProgrammeID = ?
        ORDER BY pc.Year, c.CourseName;`, [progid]
    );
};

exports.getCampuses = async function(progid) {
    return db.query(
        `SELECT b.BranchID, b.BranchName
        FROM branch b
        INNER JOIN progbranch pb ON b.BranchID = pb.BranchID
        WHERE pb.ProgrammeID = ?
        ORDER BY b.BranchName;`, [progid]
    );
};
