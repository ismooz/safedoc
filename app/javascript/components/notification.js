const button = document.getElementById("document_photos");
const nbFiles = document.querySelector(".notification");

const updateNbFiles = () => {
  if (nbFiles && button) {
    button.addEventListener("change", (event) => {
      nbFiles.innerText = button.files.length;
      nbFiles.classList.add("visible");
    });
  };
};

export { updateNbFiles };