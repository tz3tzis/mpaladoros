// The serviceworker context can respond to 'push' events and trigger
// notifications on the registration property
self.addEventListener("push", function(event) {
  var title = (event.data && event.data.text().split("-")[0]) 
                || "Message recieved";
  var body; body = event.data.text().split("-")[1];
  var tag = "push-simple-demo-notification-tag";
  var icon = 'my-push-logo-192x192.png';

  event.waitUntil(
      self.registration.showNotification(title, {
          body: body,
          icon: icon,
          tag: tag
      })
  );
});