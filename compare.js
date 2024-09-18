for (var i = 1; i < course.length; i++) {
    document.getElementById("select1").innerHTML += `
    <option value="${i}">${course[i].title}</option>
    `;
    document.getElementById("select2").innerHTML += `
    <option value="${i}">${course[i].title}</option>
    `;
}

function item1(a) {
    var select2 = document.getElementById("select2").value;
    if (a != select2) {
        
        document.getElementById("progName1").innerHTML = course[a].progName
        document.getElementById("entryReq1").innerHTML = course[a].entryReq
        document.getElementById("progOutline1").innerHTML = course[a].progOutline
        document.getElementById("fees1").innerHTML = "RM " + course[a].fees
        document.getElementById("career1").innerHTML = course[a].career
        document.getElementById("campus1").innerHTML = course[a].campus

    } else {
        document.getElementById("select1").selectedIndex = 0;
        document.getElementById("progName1").innerHTML = ""
        document.getElementById("entryReq1").innerHTML = ""
        document.getElementById("progOutline1").innerHTML = ""
        document.getElementById("fees1").innerHTML = ""
        document.getElementById("career1").innerHTML = ""
        document.getElementById("campus1").innerHTML = ""
    }
}

function item2(a) {
    var select1 = document.getElementById("select1").value;
    if (a != select1) {
        
        document.getElementById("progname2").innerHTML = course[a].progName
        document.getElementById("entryReq2").innerHTML = course[a].entryReq
        document.getElementById("progOutline2").innerHTML = course[a].progOutline
        document.getElementById("fees2").innerHTML = "RM " + course[a].fees
        document.getElementById("career2").innerHTML = course[a].career
        document.getElementById("campus2").innerHTML = course[a].campus
    } else {
        document.getElementById("select2").selectedIndex = 0;
        document.getElementById("progName2").innerHTML = ""
        document.getElementById("entryReq2").innerHTML = ""
        document.getElementById("progOutline2").innerHTML =
        document.getElementById("fees2").innerHTML = ""
        document.getElementById("career2").innerHTML = ""
        document.getElementById("campus2").innerHTML = ""
    }
}

