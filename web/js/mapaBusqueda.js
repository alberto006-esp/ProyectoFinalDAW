/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/* global google */

// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.
// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
function initAutocomplete() {
    const empresa = {lat: 36.77880260815892, lng: -6.356303784398695};
    const map = new google.maps.Map(document.getElementById("map"), {
        center: empresa,
        zoom: 18,
        mapTypeId: "roadmap",
    });
    //Cl. Banda Playa, 65, 11540 Sanlúcar de Barrameda, Cádiz direccion empresa
    // Create the search box and link it to the UI element.
    const input = document.getElementById("pac-input");
    const searchBox = new google.maps.places.SearchBox(input);

    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
    // Bias the SearchBox results towards current map's viewport.
    map.addListener("bounds_changed", () => {
        searchBox.setBounds(map.getBounds());
    });
    const contentString =
            '<div id="content">' +
            '<div id="siteNotice">' +
            "</div>" +
            '<h1 id="firstHeading" class="firstHeading">Electro.M</h1>' +
            '<div id="bodyContent">' +
            "<p><b>Electro Master S.A.</b>, Fundada en 1980, somos una empresa familiar que empezó como una tienda pequeña de productos electrónicos en Sanlúcar de Barrameda y que con la entrada de las nuevas tecnologías y la venta online nos expandimos a la mayor parte de España.</p>" +
            '<p>Dirección: Cl. Banda Playa, 65, 11540 Sanlúcar de Barrameda, Cádiz</p>'  +
            "</div>" +
            "</div>";
    const infowindow = new google.maps.InfoWindow({
        content: contentString,
    });
    const icon = "https://developers.google.com/maps/documentation/javascript/examples/full/images/info-i_maps.png";
    let marker = new google.maps.Marker({
        position: empresa,
        icon: icon,
        draggable: true,
        map: map,
        title: "Pincha para ver la información de la empresa",
    });
    marker.addListener("click", () => {
        infowindow.open({
            anchor: marker,
            map: map,
            shouldFocus: false,
        });
    });
    let markers = [];

    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener("places_changed", () => {
        const places = searchBox.getPlaces();

        if (places.length == 0) {
            return;
        }

        // Clear out the old markers.
        /* markers.forEach((marker) => {
         marker.setMap(null);
         });*/
        markers = [];

        // For each place, get the icon, name and location.
        const bounds = new google.maps.LatLngBounds();

        places.forEach((place) => {
            if (!place.geometry || !place.geometry.location) {
                console.log("Returned place contains no geometry");
                return;
            }

            const icon = {
                url: place.icon,
                size: new google.maps.Size(71, 71),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(17, 34),
                scaledSize: new google.maps.Size(25, 25),
            };

            // Create a marker for each place.
            const icon2 = "https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png";
            markers.push(
                    new google.maps.Marker({
                        map,
                        icon: icon2,
                        draggable: true,
                        title: place.name,
                        position: place.geometry.location,
                    })
                    );
            if (place.geometry.viewport) {
                // Only geocodes have viewport.
                bounds.union(place.geometry.viewport);
            } else {
                bounds.extend(place.geometry.location);
            }
        });
        map.fitBounds(bounds);
    });
}

window.initAutocomplete = initAutocomplete;

