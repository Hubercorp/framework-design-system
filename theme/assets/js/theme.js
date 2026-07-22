document.documentElement.classList.add('js');

document.querySelectorAll('[data-birthdate]').forEach((element) => {
  const birthDate = new Date(`${element.dataset.birthdate}T00:00:00`);
  const today = new Date();

  let age = today.getFullYear() - birthDate.getFullYear();
  const birthdayHasPassed =
    today.getMonth() > birthDate.getMonth()
    || (today.getMonth() === birthDate.getMonth() && today.getDate() >= birthDate.getDate());

  if (!birthdayHasPassed) age -= 1;
  element.textContent = age;
});
