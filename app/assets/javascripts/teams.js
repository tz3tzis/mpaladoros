//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require pickers
//= require jquery/clockpicker
//= require turbolinks
//= require bootstrap
//= require serviceworker-companion
//= require_tree .

window.vapidPublicKey = new Uint8Array(<%= @decodedVapidPublicKey %>);

navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
  serviceWorkerRegistration.pushManager
  .subscribe({
    userVisibleOnly: true,
    applicationServerKey: window.vapidPublicKey
  });
   .console.log("Successfylly subscribed!");
});



$('.webpush-button').on('click', (e) => {
  navigator.serviceWorker.ready
  .then((serviceWorkerRegistration) => {
    serviceWorkerRegistration.pushManager.getSubscription()
    .then((subscription) => {
      $.post('/push', {
        subscription: subscription.toJSON(),
        message: 'You clicked a button!'
      });
    });
  });
});