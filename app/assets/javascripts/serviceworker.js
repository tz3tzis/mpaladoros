// The serviceworker context can respond to 'push' events and trigger
// notifications on the registration property
self.addEventListener("push", (event) => {
  var title = (event.data && event.data.text().split("-")[0]) || "Yay a message";
  var body; body = event.data.text().split("-")[1];
  var tag = "push-simple-demo-notification-tag";
  var icon = '/assets/my-push-logo-192x192.png';

  event.waitUntil(
    self.registration.showNotification(title, {
     body: body,
     icon: icon,
     tag: tag 
   })
  );
});