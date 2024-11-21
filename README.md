<div align="center">
  <img src="app/assets/images/ios/1024.png" alt="Github Dashboard" width="200">
</div>

# Github Dashboard
A Rails application that can be installed as a Progressive Web App (PWA), transforming how you interact with GitHub through a customizable dashboard with desktop notifications.

<div align="center">
  <img src="app/assets/images/github_dashboard.png" alt="Github Dashboard Screenshot">
</div>

# 🚀 Overview

### 1. Quick Links
Customize your top navigation bar with shortcuts to any GitHub pages you frequently visit. Whether it's your team's project board, your organization's repositories, or your favorite discussion forums - keep them all just one click away.

### 2. Custom Query Feeds (Dashboards)
Harness the power of GitHub's search syntax to create personalized notification feeds.

#### Example Queries:
- 📬 Stay on top of notifications with `notifications is:unread`
- 👀 Monitor incoming review requests with `is:pr requested-review:<your-username>`
- ✅ Track issues assigned to you with `is:issue assignee:<your-username>`
- 📊 Follow specific repository activity with `repo:<owner>/<repo> is:open`
- 👥 Watch team mentions with `team:<org>/<team-name>`

## 🔔 Badge Notifications

Each dashboard can be configured to show badge notifications, allowing you to monitor the count of items matching your queries right from your browser.

<div align="center">
  <img src="app/assets/images/notifications.png" alt="Add notifications" width="600">
</div>

- 🔄 See how many pull requests need your review
- 📱 Track the number of unread notifications  
- 📋 Monitor the count of open issues assigned to you

These badge notifications update automatically, ensuring you never miss important updates without having to constantly check GitHub.

# 🛠️ Installation

### Prerequisites
- Ruby 3.2.2 or higher
- PostgreSQL 12 or higher

### Setup Steps

1. Clone the repository
2. Install dependencies:
   ```bash
   bundle install
   yarn install
   ```
3. Add your GitHub access token to your environment:
   ```bash
   echo 'export GITHUB_TOKEN="your-token-here"' >> ~/.zprofile
   source ~/.zprofile
   ```

   To get your GitHub access token:
   1. Go to GitHub.com and click your profile picture
   2. Go to Settings > Developer settings > Personal access tokens > Tokens (classic)
   3. Click "Generate new token (classic)"
   4. Give it a descriptive name like "Github Dashboard"
   5. Select these scopes:
      - `repo` - Full control of private repositories
      - `notifications` - Access notifications
      - `read:org` - Read org and team membership
   6. Click "Generate token"
   7. Copy the token and paste it in your .zprofile file
   
   ⚠️ Make sure to save the token somewhere safe as GitHub will only show it once!
4. Start the Rails server:
   ```bash
   rails server
   ```
   
   The application will now be available at `http://127.0.0.1:3000`
   
5. To install as a Progressive Web App in Chrome:
   1. Visit the application URL in Chrome
   2. Click the "Install" icon in the address bar (looks like a computer monitor with a down arrow)
   3. Click "Install" in the popup dialog
   4. The app will now be available as a standalone application on your computer


