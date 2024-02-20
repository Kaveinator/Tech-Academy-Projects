let Count = 0; // Counter for number of clicks on button

const add = (x, y) => {
  let sum = x + y; // Get sum
  document.getElementById("result").innerText += sum; // Append onto UI
  return sum; // Return sum
}

