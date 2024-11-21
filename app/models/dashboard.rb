class Dashboard < ApplicationRecord
  validates :query, presence: true

  def query_results(page: 1)
    Github::Query.new(self).query_results(page)
  end

  def query_results_count
    Github::Query.new(self).count
  end
end
