import flatpickr from "flatpickr";

const initFlatpickr = () => {
  if (document.getElementById("document_deadline")) {
    flatpickr(".datepicker_deadline", {
      dateFormat: "d.m.Y",
      defaultDate: findDate("document_deadline")
    });
    flatpickr(".datepicker_reminder", {
      dateFormat: "d.m.Y",
      defaultDate: findDate("document_reminder")
    });
  }else{flatpickr(".datepicker", {
      dateFormat: "d.m.Y",
    });
  }
}

const findDate = (type) => {
  const date = document.getElementById(type).value;

  if(date) {
    return convertDate(date);
  } else {
    return null;
  }
}

const convertDate = (dateStr) => {
  const arr = dateStr.split("-");
  const yyyy = arr[0];
  const mm = arr[1];
  const dd = arr[2];
  return dd + '.' + mm + '.' + yyyy;
}

export { initFlatpickr };

// transform 2021-04-30 to 04/30/2021
