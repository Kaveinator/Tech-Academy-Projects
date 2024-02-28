
function Display(elem) {
  let lang = elem.getAttribute("data-lang");
  alert(`${elem.innerText} is programmed in ${lang}`);
}