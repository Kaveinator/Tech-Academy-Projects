// Height Assignment
const HeightInputElem = document.getElementById("RideHeight"),
  RideResultElem = document.getElementById("RideResult"),
  RideFunc = () => RideResultElem.innerText = `You are ${HeightInputElem.value < 52 ? "too short" : "tall enough"} to ride`;

// Voting Assignment
const AgeInputElem = document.getElementById("VoteAge"),
  VoteResultElem = document.getElementById("VoteResult"),
  VoteFunc = () => VoteResultElem.innerText = `You are ${AgeInputElem.value < 18 ? "too young" : "able"} to vote`;

// Classes/Constructors
function Vehicle(make, model, year, color) {
  this.Make = make;
  this.Model = model;
  this.Year = year;
  this.Color = color;
}

const Cars = {
    Jack: new Vehicle("Dodge", "Viper", 2020, "Red"),
    Emily: new Vehicle("Jeep", "Trial Hawk", 2019, "White"),
    Eric: new Vehicle("Ford", "Pinto", 1971, "Yellow")
  },
  ResultElem = document.getElementById("NewAndThis");
  
function Func() {
  let html = "";
  Object.keys(Cars).forEach(name => {
    let car = Cars[name];
    html += `${name} drives a ${car.Color}-colored ${car.Make} ${car.Model} manufactured in ${car.Year}<br />`;
  })
  ResultElem.innerHTML = html;
}

const Delay = ms => new Promise(res => setTimeout(res, ms));
// Nested Functions
const Countdown = (elem, i) => {
  if (elem == document.getElementById("NestedFunction"))
    console.log("Same thing");
  async function _NestedFunc() {
    while (true) {
    await Delay(1000);
      elem.innerText = --i;
      if (i == 0) return;
    }
  };
  _NestedFunc();
}