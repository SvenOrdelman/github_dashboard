// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

if ('serviceWorker' in navigator) {
  // Register the service worker
  navigator.serviceWorker.register('/service-worker.js')
    .then(function(registration) {
      console.log('Service Worker registered with scope:', registration.scope);
      registration.sync.register('periodicSync');
    })
    .catch(function(error) {
      console.log('Service Worker registration failed:', error);
    });


    setInterval(async () => {
      try {
        const response = await fetch('/notifications/count');
        const data = await response.json();
        console.log('Foreground update count:', data.count);

        if (navigator.setAppBadge) {
          navigator.setAppBadge(data.count);
        }
      } catch (error) {
        console.error('Error fetching notification count (foreground):', error);
      }
    }, 20000);
}
