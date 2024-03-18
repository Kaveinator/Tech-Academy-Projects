// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function Object3DTransform(elementRefrence, DistanceX, OffsetX, DistanceY, formatStringY) {
  // Things for X-Axis
  let ViewPortTop = window.scrollY,
    ViewPortMiddle = window.scrollY + (window.innerHeight / 2),
    ViewPortBottom = window.scrollY + window.innerHeight,
    DistanceOfViewPortTopToMiddle = ViewPortMiddle - ViewPortTop,
    DistanceOfViewPortMiddleToBottom = ViewPortBottom - ViewPortMiddle,
    PercentDistanceOfViewPortTopRoMiddle = DistanceOfViewPortTopToMiddle / 100,
    PercentDistanceOfViewPortMiddleToBottom = DistanceOfViewPortMiddleToBottom / 100,
    // Values for X-Axis,
    ViewPortLeft = window.scrollX,
    ViewPortCenter = window.scrollX + (window.innerWidth / 2),
    ViewPortRight = window.scrollX + window.innerWidth,
    DistanceOfViewPortLeftToCenter = ViewPortCenter - ViewPortLeft,
    DistanceOfViewPortCenterToRight = ViewPortRight - ViewPortCenter,
    PercentDistanceOfViewPortLeftToCenter = DistanceOfViewPortLeftToCenter / 100,
    PercentDistanceOfViewPortCenterToRight = DistanceOfViewPortCenterToRight / 100,
    // First Text
    //TargetObject = document.getElementById(ElementID);, // The element
    StartingPointY = DistanceY, // Shadow Y Value (max value when out of view);
    StartingPointX = DistanceX; // Shadow X Value (max value when out of view);
  //if (true) { // I thought that I would need this but probrably not
  // Calculate for Y
  // Create range from zero
  let TopBorder = ViewPortTop - ViewPortTop; // Top is the top
  let MiddleBorder = ViewPortMiddle - ViewPortTop; // Middle is the bottom
  let ObjectPositionY = GetPosition(elementRefrence).y - ViewPortTop; // Element postion on the range
  let ObjectPositionPercentageInversed = ObjectPositionY / MiddleBorder; // This is the procees that calculates but is reversed (wrong way), next line will put it right
  let ObjectPositionPercentage = (ObjectPositionPercentageInversed * (-1)); // Will know the exact value of a element
  let ObjectPropertyValueResult = (ObjectPositionPercentage * StartingPointY); //
  elementRefrence.style.backgroundPositionY = formatStringY.replace("{0}", ObjectPropertyValueResult.toString() + 'px'); // Set it
  //}
  //if (true) { // I thought that I would need this but probably not
  // Calculate for X
  // Create range from zero
  let LeftBorder = ViewPortLeft - ViewPortLeft; // Left is the Left
  let CenterBorder = ViewPortCenter - ViewPortLeft; // Center is the Bottom
  let ObjectPositionX = GetPosition(elementRefrence).x - ViewPortLeft; // Element postion on the range
  let ObjectPositionXPercentageInversed = ObjectPositionX / CenterBorder; // This is the procees that calculates but is reversed (wrong way), next line will put it right
  let ObjectPositionXPercentage = (ObjectPositionXPercentageInversed * (-1)); // Will know the exact value of a element
  let ObjectPropertyXValueResult = (ObjectPositionXPercentage * StartingPointX); //
  //elementRefrence.style.transform = "translateY(" + OffsetY.toString() + "px)"; // Set it
  //}
}

function GetPosition(elementRefrence) {
  var xPosition = 0;
  var yPosition = 0;

  if (elementRefrence) {
    xPosition += (elementRefrence.offsetLeft - elementRefrence.scrollLeft + elementRefrence.clientLeft);
    yPosition += (elementRefrence.offsetTop - elementRefrence.scrollTop + elementRefrence.clientTop);
    elementRefrence = elementRefrence.offsetParent;
  }
  return { x: xPosition, y: yPosition };
}