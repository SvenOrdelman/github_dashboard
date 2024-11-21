class NotificationsController < ApplicationController
  def count
    total_count = Dashboard.where(track_notifications: true).sum do |dashboard|
      dashboard.query_results_count
    end

    render json: { count: total_count }
  end
end
