module Github
  class Query
    include ActiveModel::Model
    attr_accessor :dashboard

    def initialize(dashboard)
      @dashboard = dashboard
    end

    def query_results(page)
      if dashboard.query.include?("is:notification")
        search_notifications(page)
      else
        search_issues(page)
      end
    end

    def count
      if dashboard.query.include?("is:notification")
        notification_query(1, per_page: 50).count
      else
        Client.new.search_issues(dashboard.query)[:total_count].to_i
      end
    end

    private

    def search_issues(page)
      search_results = Client.new.search_issues(dashboard.query, per_page: 5, page: page)

      search_results.items.map do |issue|
        Item.new(issue)
      end
    rescue
      []
    end

    def notification_query(page, per_page: 5)
      Client.new.notifications(
        all: !dashboard.query.include?("is:unread"),
        participating: dashboard.query.include?("reason:participating"),
        owner: dashboard.query.match(/owner:(\w+)/)&.[](1),
        per_page: 5,
        page: page
      )
    rescue
      []
    end

    def search_notifications(page)
      notification_query(page, per_page: 5).map do |notification|
        Notification.new(notification)
      end
    end
  end
end
