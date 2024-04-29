abstract class StringConstance {
  ///FIREBASE COLLECTION NAME
  static const String usersCollectionName = "users";
  static const String bmiHistoryCollectionName = "bmi_history";

  ///WIDGETS
  //Error widget
  static const String defaultErrorMessage =
      "Something went wrong. Please try again later.";
  //Bmi entry item
  static const String weight = "Weight:";
  static const String height = "Height:";
  static const String ageEntryItem = "age:";
  static const String bmiStatus = "Bmi-Status:";
  static const String detailsButtonLabel = "Details";

  ///BOTTOM NAVIGATION BAR
  static const String addBmi = "Add Bmi";
  static const String history = "History";

  ///VALIDATION
  //Weight
  static const String pleaseEnterYourWeight = "Please enter your weight";
  static const String pleaseEnterValidWeight = "Please Enter a valid weight";
  //height
  static const String pleaseEnterYourHeight = "Please enter your height";
  static const String pleaseEnterValidHeight = "Please Enter a valid height";
  //age
  static const String pleaseEnterYourAge = "Please enter your age";
  static const String pleaseEnterValidAge = "Please Enter a valid age";

  ///BMI DETAILS INFO SCREEN
  static const String bmiEditedSuccessfully = "Bmi edited successfully";
  static const String editButtonLabel = "Edit";

  ///BMI HISTORY SCREEN
  static const String bmiDeletedSuccessfully = "Bmi deleted successfully";
  static const String thereIsNoHistory = "There is no history";

  ///ADD BMI SCREEN
  static const String bmiSavedSuccessfully = "Bmi added successfully";
  static const String saveBmiButtonLabel = "Save";

  ///HOME SCREEN
  static const String home = "Home";

  ///SIGN IN
  static const String welcome = "Welcome...";
  static const String signIn = "Sign In";

  ///BMI FORM VIEW
  static const weightInKilograms = "Weight in kilograms";
  static const heightInMeters = "Height in meters";
  static const age = "Age";
  static const calculateBmi = "Calculate BMI";
  static const underweight = "Underweight";
  static const normal = "Normal";
  static const overweight = "Overweight";
  static const obesity = "Obesity";
}
