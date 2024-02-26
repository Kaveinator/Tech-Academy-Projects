const GlobalVar = "Hello";

function Hello() {
  try { console.log(_unknownVar); }
  catch (err) { console.error(`Ops ${err}`); }
}

const DateElem = document.getElementById("date"); 
function OnParagraphClicked(dateElem) {
  dateElem.innerText = new Date().getHours() > 12 ? "PM" : "AM";
}

// step 150
const TimeOfDayOutputElem = document.getElementById("TimeOfDay");
function TimeFunc() {
  let hours = new Date().getHours(), reply;
  if (hours < 12 == hours > 0)
    reply = "It's Morning!"
  else if (hours >= 12 == hours < 18)
    reply = "It's afternoon";
  else reply = "It's evening";
  TimeOfDayOutputElem.innerText = reply;
}

// Step 152 (Submission)
const UsernameValidationInput = document.getElementById("usernameInput"),
  UsernameValidationOutput = document.getElementById("usernameToast");
function ValidateUsername() {
  let username = UsernameValidationInput.value.trim();
  if (username.length > 2)
    UsernameValidationOutput.innerText = "Valid Username";
  else UsernameValidationOutput.innerText = "Invalid Username";
}