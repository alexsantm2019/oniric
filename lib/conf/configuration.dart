const BASE = "gpstest.andeantc.com";
const BASE_MAIL = "profiles.andeantc.com";

//BARCOS
const PATH_VESSELS = '/api/vessel/getAll';
//DETALLE BARCOS
const PATH_GET_VESSEL_INFO = '/api/vessel/get-vessel-id/';
//SERVICIOS DE BARCOS:
const PATH_GET_VESSEL_SERVICES = '/api/service/get-vessel-services/';
//SERVICIOS DE BARCOS:
const PATH_GET_CABINS_BY_VESSEL = '/api/cabin/get-cabins-by-vessel/';
//CATALOGO:
const PATH_CATALOGO = '/api/metadata/getMetadataByGroup/';
//DISPONIBILIDAD:
const PATH_AVAILABILITY = '/api/availability/get-availability';
//ITINERARIES:
const PATH_ITINERARY = '/api/itinerary/';
//SEND MAIL:
const PATH_MAIL = '/api/mail/sendMailApp';
//IMAGES:
const PATH_IMAGES = '/api/filebox/getImagesFromVslId/';

//WHATSAPP CONTACT:
const WHATSAPP_CONTACT = '+593998974711';

const VESSELS_DEFAULT = [
  'images/default_slider_boats/vessel1.jpg',
  'images/default_slider_boats/vessel2.jpg',
  'images/default_slider_boats/vessel3.jpg',
  'images/default_slider_boats/vessel4.jpg',
  'images/default_slider_boats/vessel5.jpg'
];
