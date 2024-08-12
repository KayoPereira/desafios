// TODO: Autocomplete the input with AJAX calls.
const input = document.getElementById('search');
const results = document.getElementById('results');

const wordsList = (data) => {
  results.innerHTML = '';
  data.words.forEach((word) => {
    results.insertAdjacentHTML('beforeend', `<li>${word}</li>`);
  });
};

const autocomplete = (event) => {
  fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${event.target.value}`)
    .then(response => response.json())
    .then(data => wordsList(data));
};

input.addEventListener('keyup', autocomplete);
