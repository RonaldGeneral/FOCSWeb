const dotenv = require("dotenv");
const { GoogleGenerativeAI } = require("@google/generative-ai");

dotenv.config({ path: ".env", debug: true });
const genAI = new GoogleGenerativeAI(process.env.API_KEY);

function parseJSON(input) {
    let startIndex = input.indexOf('{');
    if (startIndex === -1) {
        console.error('No JSON object found in the string.');
        return null;
    }

    let braceCounter = 0;
    let endIndex = startIndex;

    for (let i = startIndex; i < input.length; i++) {
        if (input[i] === '{') {
            braceCounter++;
        } else if (input[i] === '}') {
            braceCounter--;
        }

        // When braceCounter reaches 0, we've found the full JSON object
        if (braceCounter === 0) {
            endIndex = i;
            break;
        }
    }

    if (braceCounter !== 0) {
        console.error('Mismatched curly braces in the input string.');
        return null;
    }

    // Extract the potential JSON substring
    let jsonString = input.slice(startIndex, endIndex + 1);

    // Regular expression to properly quote object keys (unquoted JSON-like syntax)
    jsonString = jsonString.replace(/([{,]\s*)([a-zA-Z_]\w*)(\s*:)/g, '$1"$2"$3');

    try {
        // Parse the extracted and fixed JSON string
        const jsonObject = JSON.parse(jsonString);
        return jsonObject;
    } catch (error) {
        console.error('Error parsing JSON:', error);
        return null;
    }

}

exports.describeCourse = async function(course) {
    model = genAI.getGenerativeModel({
        model: "gemini-1.5-flash",
        systemInstruction: `
            Describe the course given for university TARUMT in 30 - 50 words in sentences starting with verbs
        `
    })
    
    const prompt =
        "describe course '"+course+"'";

    const result = await model.generateContent(prompt);
    const response = await result.response;
    const text = response.text();
    console.log(text);

    return text;
}

exports.listCareer = async function(programme, course) {
    model = genAI.getGenerativeModel({
        model: "gemini-1.5-flash",
        systemInstruction: `
            List the 3-4 possible careers for a given university course for students pursuing list career for people pursuing `+programme+` in following json format:
            {
                careers: [<career1>, <career2>, <career3>]
            }
        `
    })
    
    const prompt =
        "list career for course '"+course+"'";

    const result = await model.generateContent(prompt);
    const response = await result.response;
    const text = response.text();
    console.log(text);

    resObj = parseJSON(text);
    console.log(resObj);
    careers = resObj.careers??[];
    return careers;
}

