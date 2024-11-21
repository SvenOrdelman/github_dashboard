let count = 0;

async function fetchCount() {
  try {
    const response = await fetch('/notifications/count');
    const data = await response.json();
    count = data.count;
    console.log(count);
    if (navigator.setAppBadge) {
      navigator.setAppBadge(count);
    }
  } catch (error) {
    console.error('Error fetching notification count:', error);
  }
}

// Fetch initial count
fetchCount();

// Update count every 10 seconds
setInterval(fetchCount, 10000);
