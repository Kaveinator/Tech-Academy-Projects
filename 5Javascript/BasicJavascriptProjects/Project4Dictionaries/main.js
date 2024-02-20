// Refrence to element to print to, and sample data
const ResultElem = document.getElementById("Dictionary"),
  UserProfile = {
    Username: "HelloWorld",
    Password: "You wish lol",
  },
  // Function to show name and value of kvp
  Show = key => ResultElem.innerText = `${key}: ${UserProfile[key]}`;
;
delete UserProfile.Password; // Delete password, app's aren't supposed to cache this