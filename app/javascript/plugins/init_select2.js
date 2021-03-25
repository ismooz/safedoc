import 'select2';
// avec rails on doit importer directement à ce stade là, et non pas dans le head.
// pour le js, rails va automatiquement voir dans node_modules
import 'select2/dist/css/select2.css';

/* on pourrait aussi passer les données via un array au lieu de les passer via une association
 dans ce cas-ci on passe data: data dans select2
const data = [
  {
      id: 1,
      text: 'Privé'
  },
  {
      id: 2,
      text: 'Professionnel'
  }
];
*/

const initSelect2 = () => {
  $(function() {
    // folders correspond à l'id qu'on a donné dans le champ select
    $('#folders').select2( { width: '100%', placeholder: "Choose a folder" });
});
};

export { initSelect2 };