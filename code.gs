function doGet(request){
  // Open Google Sheet using ID
  var sheet = SpreadsheetApp.openById("1OOArrqjOqmD4GiJOWlluZ4woTMH_qaV6RKv4JXnT3Hk");

  // Get all values in active sheet
  var values = sheet.getActiveSheet().getDataRange().getValues();
  var data = [];

  for (var i = values.length - 1; i >= 0; i--) {

    // Get each row
    var row = values[i];

    // Create object
    var feedback = {};

    feedback['name'] = row[0];
    feedback['email'] = row[1];
    feedback['mobile_no'] = row[2];
    feedback['feedback'] = row[3];

    // Push each row object in data
    data.push(feedback);
  }

  // Return result
  return ContentService
  .createTextOutput(JSON.stringify(data))
  .setMimeType(ContentService.MimeType.JSON);
}

function doPost(request){
  // Open Google Sheet using ID
  var sheet = SpreadsheetApp.openById("1OOArrqjOqmD4GiJOWlluZ4woTMH_qaV6RKv4JXnT3Hk");
  var result = {"status": "SUCCESS"};
  try{
    // Get all Parameters
    var name = request.parameter.name;
    var email = request.parameter.email;
    var mobileNo = request.parameter.mobileNo;
    var feedback = request.parameter.feedback;

    // Append data on Google Sheet
    var rowData = sheet.appendRow([name, email, mobileNo, feedback]);

  }catch(exc){
    // If error occurs, throw exception
    result = {"status": "FAILED", "message": exc};
  }

  // Return result
  return ContentService
  .createTextOutput(JSON.stringify(result))
  .setMimeType(ContentService.MimeType.JSON);
}
