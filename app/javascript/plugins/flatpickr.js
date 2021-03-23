import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    minDate: "today",
    dateFormat: "d.m.Y",
  });
}

export { initFlatpickr };
