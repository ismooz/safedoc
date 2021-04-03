const reminderStr = document.getElementById("document_reminder");
const deadlineStr = document.getElementById("document_deadline");
const span = document.getElementById("span");

const alertDeadline = () => {
  if (reminderStr && deadlineStr && span) {
    deadlineStr.addEventListener("change", (event) => {
    const deadlineDate = stringToDate(deadlineStr);
    const reminderDate = stringToDate(reminderStr);
    const ecart = deadlineDate - reminderDate;
    const nbDays = Math.floor(ecart / (1000 * 3600 * 24));
    span.innerText = "(Reminder is set ".concat(nbDays).concat(" days before)");
    });
  };
};

const alertReminder = () => {
  if (reminderStr && deadlineStr && span) {
    reminderStr.addEventListener("change", (event) => {
    const deadlineDate = stringToDate(deadlineStr);
    const reminderDate = stringToDate(reminderStr);
    const ecart = deadlineDate - reminderDate;
    const nbDays = Math.floor(ecart / (1000 * 3600 * 24));
    span.innerText = "(Reminder is set ".concat(nbDays).concat(" days before)");
    });
  };
};

const stringToDate = (str) => {
  const arr = str.value.split("/");
  return new Date(arr[2], arr[1] - 1, arr[0]);
}

export { alertDeadline, alertReminder };