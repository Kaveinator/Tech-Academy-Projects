const SizeElems = [...document.getElementsByClassName("size")],
  ToppingElems = [...document.getElementsByClassName("topping")],
  ResultTextElem = document.getElementById("ResultText"),
  PriceElem = document.getElementById("TotalPrice");

let temp;
function GetReceipt() {
  let stringBuilder = "<h3>You Ordered:</h3>",
    selectedSizeElem = SizeElems.find(elem => elem.checked),
    subTotal = Number(selectedSizeElem.getAttribute("cost"));
  stringBuilder += `${selectedSizeElem.value}<br />`;
  temp = selectedSizeElem;
  AppendToppingCost(subTotal, stringBuilder);
}

function AppendToppingCost(subTotal, stringBuilder) {
  let selectedToppingElems = ToppingElems.filter(elem => elem.checked)

  for (let i = 0; i < selectedToppingElems.length; i++) {
    stringBuilder += `${selectedToppingElems[i].value}<br />`;
  }
  let toppingsCost = selectedToppingElems.length > 0
    ? selectedToppingElems.length - 1 : 0;
  subTotal += toppingsCost;

  ResultTextElem.innerHTML = stringBuilder;
  PriceElem.innerHTML = `<h3>Total: <strong>$${subTotal}.00</strong></h3>`;
}