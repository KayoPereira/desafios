// TODO: Write your gambling application here.
const scratchcards = document.querySelectorAll('.scratchcard');
const balance = document.getElementById('balance');
const price = 10;

scratchcards.forEach((scratchcard) => {
  scratchcard.addEventListener("click", (event) => {
    event.preventDefault();
    let currentBalance = parseInt(balance.innerText, 10);
    const scratchcardAmount = parseInt(scratchcard.dataset.amount, 10);
    if (currentBalance > 0 && scratchcard.dataset.scratched !== "true") {
      scratchcard.dataset.scratched = "true";
      currentBalance -= price;
      balance.innerText = currentBalance + scratchcardAmount;
      scratchcard.innerText = `${scratchcardAmount}€`;
    } else {
      alert('Você já comprou essa raspadinha!!!!');
    }
  });
});
