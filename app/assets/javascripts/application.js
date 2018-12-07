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



$(document).on('turbolinks:load', function(){
	if ($('#map').length > 0) {
		var google_maps = $('meta[name=google_maps]').attr("content");
		$.getScript(`https://maps.googleapis.com/maps/api/js?key=${google_map}&callbavk=initMap`);
	}
})



//================== user allow notifications =============================//

// Let's check if the browser supports notifications
if (!("Notification" in window)) {
  console.error("This browser does not support desktop notification");
}

// Let's check whether notification permissions have already been granted
else if (Notification.permission === "granted") {
  console.log("Permission to receive notifications has been granted");
}

// Otherwise, we need to ask the user for permission
else if (Notification.permission !== 'denied') {
  Notification.requestPermission(function (permission) {
    // If the user accepts, let's create a notification
    if (permission === "granted") {
      console.log("Permission to receive notifications has been granted");
    }
  });
}

//====================== Web push notifications =============================//

// Register the serviceWorker script at /serviceworker.js from your server if supported
if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js')
  .then(function(reg) {
     console.log('Service worker change, registered the service worker');
  });
}
// Otherwise, no push notifications :(
else {
  console.error('Service worker is not supported in this browser');
}


// anaktisi tou vapid key kai tropopoihsh tou
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

// Send the subscription and message from the client for the backend
// to set up a push notification
$(".webpush-button").on("click", (e) => {
  navigator.serviceWorker.ready
  .then((serviceWorkerRegistration) => {
    serviceWorkerRegistration.pushManager.getSubscription()
    .then((subscription) => {
      $.post("/push", { subscription: subscription.toJSON(), message: "You clicked a button!" });
    });
  });
});

























