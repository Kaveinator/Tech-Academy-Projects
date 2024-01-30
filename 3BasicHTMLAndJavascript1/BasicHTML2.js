function MyFunction() {
  let contents = "Hello World!",
    result = contents.fontcolor("green"),
    contentElem = document.getElementById("Content");
  contentElem.innerHTML = result;
}