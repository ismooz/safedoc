import 'select2';
import 'select2/dist/css/select2.css';

const initSelect2 = () => {
  // $('.select2').select2();
  $(function() {
    $('.select2').select2( { width: '100%', theme: 'classic' });
});
};

export { initSelect2 };