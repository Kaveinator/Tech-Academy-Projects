const HelloStr = "Hello",
  ContactResultElem = document.getElementById("ConcatResult");

function Start() {
  ConcatMethod();
  SliceMethod();
  PrecisionMethod();
  FixedAndValueMethod();
}

function ConcatMethod() {
  // Step 157
  let worldStr = "World";
  ContactResultElem.innerText = HelloStr.concat(' ', worldStr, '!');
}

// Step 158, 159
const SliceResultElem = document.getElementById("SliceResult");
function SliceMethod() {
  let sentence = "Hello World!",
    section = sentence.slice(6, 11);
  // Step 160, 162
  SliceResultElem.innerText = `${section.toUpperCase()} at index ${sentence.search("World").toString()}`;
}

// Step 163, 164
const PrecisionResultElem = document.getElementById("PrecisionResult"),
  PreciseValue = 12938.3012987376112;
function PrecisionMethod() {
  PrecisionResultElem.innerText = PreciseValue.toPrecision(10);
}

// Step 165
const FixedResultElem = document.getElementById("FixedResult"),
  ValueResultElem = document.getElementById("ValueResult");
function FixedAndValueMethod() {
  FixedResultElem.innerText = PreciseValue.toFixed(2);
  ValueResultElem.innerText = PreciseValue.valueOf();
}