const ColorInputElem = document.getElementById("ColorInput"),
  ColorResultElem = document.getElementById("ColorOutput");
function ColorFunc() {
  let input = ColorInputElem.value.trim(),
    hexColor = "#000";
  switch (input.toLowerCase()) {
    case "red":
      hexColor = "#f00";
      break;
    case "yellow":
      hexColor = "#ffff00";
      break;
    case "green":
      hexColor = "#0f0";
      break;
    case "blue":
      hexColor = "#00f";
      break;
    case "pink":
      hexColor = "#ffc0cb";
      break;
    case "purple":
      hexColor = "#dda0dd";
      break;
    default:
      // Nothing really needs to be done here
      break;
  }
  ColorResultElem.style.color = hexColor;
  if (hexColor == "#000") {
    ColorResultElem.innerText = "Use a color from the list above";
    return;
  }
  ColorResultElem.innerText = hexColor == "#000"
    ? "Use a color from the list above"
    : `${input} is a great color!`;
}