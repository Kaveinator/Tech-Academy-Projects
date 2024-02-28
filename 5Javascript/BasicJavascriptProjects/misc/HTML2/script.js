var FormElem;
function ValidateForm(formElem) {
  let name = formElem["name"].value.trim(),
    email = formElem["email"].value.trim(),
    msg = formElem["msg"].value.trim(),
    error = "";
  if (name.length < 2)
    error += "Name must be at least two characters\n";
  if (email.length < 8) // Assumes shorted email is xx@xx.xx
    error += "Enter a valid email (at least 8 characters)\n";
  console.log(formElem);
  if (msg.length < 10) // Probrably needs to be more descriptive
    error += "Message is too short";
  if (error.length == 0)
    return true;
  alert(error);
  return false;
}