// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//----------i added those---------------
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require pickers
//= require jquery/clockpicker
//= require turbolinks
//= require bootstrap
//= require_tree .
//= require serviceworker-companion


$(document).on('turbolinks:load', function(){
	if ($('#map').length > 0) {
		var google_maps = $('meta[name=google_maps]').attr("content");
		$.getScript(`https://maps.googleapis.com/maps/api/js?key=${google_map}&callbavk=initMap`);
	}
});


//=====================SUBSCRIPTION==========================================

window.vapidPublicKey = new Uint8Array(<%= Base64.urlsafe_decode64(ENV['VAPID_PUBLIC_KEY']).bytes %>);

// When serviceWorker is supported, installed, and activated,
// subscribe the pushManager property with the vapidPublicKey
navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
  serviceWorkerRegistration.pushManager
  .subscribe({
    userVisibleOnly: true,
    applicationServerKey: window.vapidPublicKey
  });
});



















