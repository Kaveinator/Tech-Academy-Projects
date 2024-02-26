// Step 198
const StringLengthResultElem = document.getElementById("StringLengthResultElem");
function PrintLengthOf(str,) { StringLengthResultElem.innerText = str.length; }

// Step 201
const ListOfInstrumentsElem = document.getElementById("ListOfInstruments"),
  Instruments = [ "Drums", "Guitar", "Piano" ];
function ForLoop() {
  let result = "";
  for (let i = 0; i < Instruments.length; i++)
    result += `${Instruments[i]}<br />`;
  ListOfInstrumentsElem.innerHTML = result;
}

// Step 205
const ArrayResultElem = document.getElementById("Array"),
  SampleArr = [1, 2, 3];
function ArrayFunc() {
  let result = "";
  SampleArr.forEach(i => result += `${i}<br />`);
  ArrayResultElem.innerHTML = result;
}

// Step 221
const AppInstanceResultElem = document.getElementById("AppInstanceSummary");
let AppInstance = {
  Username: "Kaveman",
  Role: "C# Developer",
  Summary: function() { return `${this.Username} is a ${this.Role}`; } 
};
AppInstanceResultElem.innerText = AppInstance.Summary();

// Step 222
let i = 0;
while (i < SampleArr.length) {
  let o = SampleArr[i++];
  if (o % 2 == 0) {
    console.log(`${o} (even)`);
    break; // Break, exits the loop entirely
  }
  console.log(o);
}
for (i = 0; i < SampleArr.length; i++) {
  let o = SampleArr[i];
  if (o % 2 == 0) {
    console.log(`${o} (even)`);
    continue; // Continue will end the current iteration but proceed to the next iteration (if there is one)
  }
  console.log(o);
}