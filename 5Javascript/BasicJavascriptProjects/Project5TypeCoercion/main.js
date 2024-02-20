[ 23, true, false, 0.1, "HelloWorld", 0 / 0, 3E310, -3E310] // Req 1: used document.write and typeof
.forEach(x => document.write(`${x} is a ${typeof(x)} (isNaN: ${isNaN(x)})<br />`));

[3 , 4, 32, 123, 8, 9, 0] // 126 Req 3 (1/3): Used <, >
.forEach(x => document.write(`${x} > 0? ${x > 0} (Reverse: ${x < 0})<br />`));
console.log("2" + 2); // Req 2: 2 (string) + 2 (number)

[ [1, 1], [12, "21"], [ 0, false], [12, 21] ]  // 126 Req 3 (2/3): Used ==, ===
.forEach(tuple => document.write(`${tuple[0]} === ${tuple[1]}: ${tuple[0] === tuple[1]} ('==' => ${tuple[0] == tuple[1]}) <br />`));

[ true && false, true || false] // 126 Req 3 (3/3): Used AND, OR, NOT
.forEach(bool => console.log(`${bool} != !${!bool}`));
