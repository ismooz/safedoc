// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)ff
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { openFolder } from '../components/folder';
import { sidebar } from '../components/sidebar';
import { initFlatpickr } from "../plugins/flatpickr";
import { calculate } from '../components/reminder';
import { alertDeadline, alertReminder } from '../components/reminder_alert';
import { updateNbFiles } from '../components/notification';


window.addEventListener('load', () => {
   openFolder();
   sidebar();
   initFlatpickr();
   // calculate(30); // reminder date is set 30 days back
   // alertDeadline();
   // alertReminder();
   updateNbFiles();
  });
