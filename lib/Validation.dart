class Validation{
  

static String valPassword(String value)
{
  Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) 
      return 'Please Enter Password';
    else if(value.length<6)
    return 'Password too short';
     else 
      if (!regex.hasMatch(value))   return 'Enter valid password';  
      else  return null;
}


static String valEmail(String value)
 {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value.isEmpty) 
      return 'Please Enter Email';
     else 
      if (!regex.hasMatch(value))   return 'Enter valid Eamil (example@domain.com)';   
      else  return null;

}


static String valName(String value) 
{
  if (value.isEmpty) 
      return 'Please Enter Your Name'; 
      else  return null;

 }
}



