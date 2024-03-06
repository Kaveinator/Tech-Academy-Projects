/* One Page Lightbox Challenge
 * The page is designed to reuse the mediaTiles and display them in the lightbox,
 * ensuring that states are preserved (if you have a youtube video or
 * other dynamic content) 
 */

const MediaElem = document.getElementById("media"),
  MediaBackground = MediaElem.querySelector(".close"),
  MediaTiles = MediaElem.getElementsByClassName("mediaTile"),
  IndexIndicatorContainer = MediaElem.querySelector(".indexIndicators"),
  MediaIndexName = "mediaIndex", SelectedMediaName = "selected";

let CurrentMediaIndex = -1,
  CurrentMediaElem = undefined,
  IndicatorElems = [];

function InitLightbox() {
  for (let i = 0; i < MediaTiles.length; i++) {
    let elem = MediaTiles[i];
    elem.setAttribute(MediaIndexName, i);
    elem.onclick = () => ShowMedia(elem);
    let indicator = document.createElement("span");
    indicator.classList.add("dot");
    indicator.onclick = elem.onclick;
    IndicatorElems.push(indicator);
    IndexIndicatorContainer.appendChild(indicator);
  }
  MediaBackground.onclick = () => SetLightboxState(false);
}

function SetLightboxState(active) {
  if (MediaElem.classList.contains("lightbox") != active)
    MediaElem.classList.toggle("lightbox");
}

function ShowMedia(elem) {
  if (elem == undefined) return;
  if (CurrentMediaElem == elem) return SetLightboxState(true);
  if (CurrentMediaElem != undefined) {
    CurrentMediaElem.classList.remove(SelectedMediaName);
    IndicatorElems[CurrentMediaIndex].classList.remove(SelectedMediaName);
  }
  CurrentMediaElem = elem;
  CurrentMediaIndex = Number(elem.getAttribute(MediaIndexName));
  SetLightboxState(true);
  elem.classList.add(SelectedMediaName);
  IndicatorElems[CurrentMediaIndex].classList.add(SelectedMediaName);
}

function ShiftIndex(delta) {
  if (CurrentMediaIndex == -1) return;
  let nextIndex = (CurrentMediaIndex + delta) % MediaTiles.length;
  if (nextIndex < 0) nextIndex += MediaTiles.length;
  ShowMedia(MediaTiles[nextIndex]);
}