const SecondsInputElem = document.getElementById("Seconds"),
  TimerStatusElem = document.getElementById("TimerStatus"),
  TimerStartButton = document.getElementById("TimerStartButton");
let TimerCounterId = -1;

function OnTimerButtonPressed() {
  // TimerCounterId is -1 when there is no timer present, so start one
  if (TimerCounterId == -1) {
    Countdown();
    return;  
  }
  // This code is ran to reset the timer, this is ran when there is a timer already
  clearInterval(TimerCounterId);
  TimerCounterId = -1;
  TimerStatusElem.innerText = "Canceled";
  TimerStartButton.innerText = "Start";
}

function Countdown() {
  let seconds = +SecondsInputElem.value;
  TimerCounterId = setInterval(_tick, 1000);
  // Show timer, and disable button
  TimerStatusElem.innerText = seconds; // Update to show current seconds
  TimerStartButton.innerText = "Reset";
  function _tick() {
    if (--seconds == -1) {
      // Once timer ends, update text, clear interval, and enable button
      TimerStatusElem.innerText = "Time's up!";
      clearInterval(TimerCounterId);
      TimerCounterId = -1;
      TimerStartButton.innerText = "Start";
      return;
    }
    TimerStatusElem.innerText = seconds;
  }
}


const SlideElems = document.getElementsByClassName("slide"),
  DotElems = document.getElementsByClassName("dot");
  SetIndex = n => ShowSlide(CurrentSlideIndex = n),
  ShiftIndex = n => ShowSlide(CurrentSlideIndex += n);
let CurrentSlideIndex = 1,
  AutoSlideshowTimerId = -1;

function Start() {
  ShowSlide(CurrentSlideIndex);
  AutoSlideshowTimerId = setInterval(() => ShiftIndex(1), 10000);
}

function ShowSlide(n) {
  if (n > SlideElems.length) CurrentSlideIndex = 1;
  if (n < 1) CurrentSlideIndex = slides.length;
  for (let i = 0; i < SlideElems.length; i++)
    SlideElems[i].style.display = "none";
  for (i = 0; i < DotElems.length; i++)
    DotElems[i].classList.remove("active");
  SlideElems[CurrentSlideIndex - 1].style.display = "block";
  DotElems[CurrentSlideIndex - 1].classList.add("active");
} 