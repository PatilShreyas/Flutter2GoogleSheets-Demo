function doGet(request){
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
