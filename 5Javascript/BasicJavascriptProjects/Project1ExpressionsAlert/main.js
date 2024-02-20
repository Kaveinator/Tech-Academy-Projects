const GlobalString = "Hello World",
  Sent1 = "This is the beginning of the string", // Req 2.1
  Sent2 = "and this is the end of the string"; // Req 2.2
let result = `${Sent1} ${Sent2}`; // Req 3: Append Sent2 onto Sent1
alert(GlobalString); // Req 1 (1/2): Say hello
document.write(result); // Req 1 (2/2): Print result
console.log(3 + 3); // Req 4: Expression
// Req 6: ^ Add comments