//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require pickers
//= require jquery/clockpicker
//= require turbolinks
//= require bootstrap
//= require serviceworker-companion
//= require_tree .

window.vapidPublicKey = new Uint8Array(<%= Base64.urlsafe_decode64(ENV['VAPID_PUBLIC_KEY']).bytes
 %>);

navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
  serviceWorkerRegistration.pushManager
  .subscribe({
    userVisibleOnly: true,
    applicationServerKey: window.vapidPublicKey
  });
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