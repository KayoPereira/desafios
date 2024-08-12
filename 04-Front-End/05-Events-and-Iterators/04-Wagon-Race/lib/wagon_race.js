// TODO: write your code here
const moveForward = (player, key) => {
  const wagon = document.querySelector(`#player${player}-race .active`);
  if (key !== "w" && wagon.nextElementSibling) {
    wagon.nextElementSibling.classList.add('active');
    wagon.classList.remove('active');
  } else if (key === "w" && wagon.previousElementSibling) {
    wagon.previousElementSibling.classList.add('active');
    wagon.classList.remove('active');
  } else {
    if (key === "w") {
      alert(`Você não pode mais voltar!!!`);
    } else {
      alert(`Player ${player} wins! Play again?`);
      window.location.reload();
    }
  }
};

const moveWagons = (event) => {
  if (event.key === "q") {
    moveForward(1, event.key);
  } else if (event.key === "p") {
    moveForward(2, event.key);
  } else if (event.key === "w") {
    moveForward(1, event.key);
  }
};

document.addEventListener("keyup", moveWagons);
