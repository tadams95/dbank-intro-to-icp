import { dbank } from "../../declarations/dbank";

//async function because the checkBalance function in main.mo is asynchronous as well
window.addEventListener("load", async function() {
  console.log("Finished loading");
  //check balance and assign to currentAmount constant
  //use await with async
  update();
});

// # for ids, (.) dot for class, 
document.querySelector("form").addEventListener("submit", async function (event) {
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");

  //get user inputs, parse to Float data type
  const depositAmount = parseFloat(document.getElementById("deposit-amount").value);
  const withdrawalAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  //if the user has inputted a value into the deposit input
  if (document.getElementById("deposit-amount").value.length != 0 ) {
     //call topUp function and use deposit amount
  await dbank.topUp(depositAmount);
  }
  
  //if the user has inputted a value into the withdrawal input
  if (document.getElementById("withdrawal-amount").value.length != 0 ) {
    //call the withdraw function and use the withdrawalAmount
    await dbank.withdraw(withdrawalAmount);
  }
  
  await dbank.compound();
 
  update();

  //reset inputs to empty
  document.getElementById("deposit-amount").value="";
  document.getElementById("withdrawal-amount").value="";

  button.removeAttribute("disabled");

  // console.log("Finalize Transaction button pressed");

}) ;

async function update() {
    const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount *100) / 100;
};

// dbank.checkBalance