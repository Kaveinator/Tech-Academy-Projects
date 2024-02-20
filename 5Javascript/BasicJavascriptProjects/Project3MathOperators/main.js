let Count = 0, x = 0, y = 0;

const ResultElem = document.getElementById("math"),
  /* All functions work pretty much the same,
   *  1. Create result
   *  2. Show expression and result
   *  3. Return result
   */
  // Addition
  add = (x = 5, y = 2) => {
    let result = x + y; // Get result
    ResultElem.innerText = `${x} + ${y} = ${result}`; // Append onto UI
    return result; // Return result
  },
  // Subtraction
  subtract = (x = 5, y = 2) => {
    let result = x - y; // Get result
    ResultElem.innerText = `${x} - ${y} = ${result}`; // Append onto UI
    return result; // Return result
  },
  // Multiplication
  multiply = (x = 6, y = 8) => {
    let result = x * y; // Get result
    ResultElem.innerText = `${x} * ${y} = ${result}`; // Append onto UI
    return result; // Return result
  },
  // Division
  divide = (x = 48, y = 86) => {
    let result = x / y; // Get result
    ResultElem.innerText = `${x} / ${y} = ${result}`; // Append onto UI
    return result; // Return result
  },
  // Somewhere math.random is used
  secretOperation = (x = 1, y = 2, z = 10, w = 5) => {
    let result = (x + y) * z / y - (Count + w + Math.random());
    ResultElem.innerText = `You'll never know = ${~result}`;
    return result;
  },
  // Remainder
  modulus = (x = 25, y = 6) => {
    let result = x % y; // Get result
    ResultElem.innerText = `${x} % ${y} = ${result}`; // Append onto UI
    return result; // Return result
  },
  // Increment
  inc = x => {
    ResultElem.innerText = ++x;
    return x;
  },
  // Decrement
  dec = x => {
    ResultElem.innerText = --x;
    return x;
  }
;