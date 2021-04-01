const deadlineStr = document.getElementById("document_deadline");

const calculate = (days) => {
  if (deadlineStr) {
    deadlineStr.addEventListener("change", (event) => {
    const deadlineDate = stringToDate(deadlineStr);
    const reminder = document.getElementById("document_reminder");
    reminder.value = calculateDate(deadlineDate, days);
    });
  };
};

const calculateDate = (date, days) => {
  const newTs = date - (days * 1000 * 3600 * 24);
  const newDate = new Date(newTs);
  return dateToString(newDate);
}

const stringToDate = (str) => {
  const arr = str.value.split("/");
  return new Date(arr[2], arr[1] - 1, arr[0]);
}

const dateToString = (date) => {
  const dd = String(date.getDate()).padStart(2, '0');
  const mm = String(date.getMonth() + 1).padStart(2, '0'); //January is 0!
  const yyyy = date.getFullYear();
  return dd + '/' + mm + '/' + yyyy;
}
export { calculate };
