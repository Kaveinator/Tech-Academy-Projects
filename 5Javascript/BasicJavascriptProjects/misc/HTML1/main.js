/* Refrences:
 * https://www.w3schools.com/html/html5_canvas.asp
 * https://www.w3schools.com/tags/ref_canvas.asp
 */

const CanvasElem = document.getElementById("Canvas"),
  CanvasContext = CanvasElem.getContext("2d");

// Define Gradient
const GradientStyle = CanvasContext.createLinearGradient(0, 0, 170, 0);
GradientStyle.addColorStop(0, "black");
GradientStyle.addColorStop(1, "#131a26");

// Use Gradient
CanvasContext.fillStyle = GradientStyle;
CanvasContext.fillRect(20, 20, 150, 100); 

// Reset fille style
CanvasContext.fillStyle = "#fff";

// Line
CanvasContext.moveTo(0, 0);
CanvasContext.lineTo(200, 100);
CanvasContext.stroke();

// Circle
CanvasContext.beginPath();
CanvasContext.arc(95, 50, 40, 0, 2 * Math.PI);
CanvasContext.stroke();

// Text
CanvasContext.font = "30px Arial";
CanvasContext.fillText("Hello World!", 10, 50);
