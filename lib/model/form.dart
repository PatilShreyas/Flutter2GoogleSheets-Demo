/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String _name;
  String _email;
  String _mobileNo;
  String _feedback;

  FeedbackForm(this._name, this._email, this._mobileNo, this._feedback);

  // Method to make GET parameters.
  String toParams() => 
  "?name=$_name&email=$_email&mobileNo=$_mobileNo&feedback=$_feedback";
  
  // Method to make model as JSON
  Map<String, dynamic> toJson() {
    return {
      "name": _name,
      "email": _email,
      "mobileNo": _mobileNo,
      "feedback": _feedback,
    };
  }
}
