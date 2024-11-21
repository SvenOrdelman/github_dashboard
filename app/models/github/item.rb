module Github
  class Item
    include ActiveModel::Model
    attr_accessor :issue

    def initialize(issue)
      pp issue
      @issue = issue
    end
    def name
      issue[:name]
    end

    def login
      issue[:login]
    end

    def avatar_url
      issue[:avatar_url]
    end

    def repository_name
      issue[:repository_name]
    end

    def description
      issue[:description]
    end

    def icon
      case type
      when :pull_request
        "fa-code-pull-request"
      else
        "fa-circle-dot"
      end
    end

    def type
      if issue[:pull_request].present?
        :pull_request
      else
        :issue
      end
    end

    def repository
      url.split('repos/').last.split('/').first(2).join('/')
    end

    def created_at
      issue[:created_at]
    end

    def html_url
      issue[:html_url]
    end

    def draft
      issue[:draft]
    end

    def url
      issue[:url]
    end

    def title
      issue[:title]
    end

    def number
      issue[:number]
    end

    def labels
      issue[:labels]
    end

    def state
      draft ? "draft" : issue[:state]
    end

    def state_color
      if state == "open"
        "bg-blue-500"
      elsif state == "draft"
        "bg-gray-500"
      else
        "bg-red-500"
      end
    end

    def assignees
      issue[:assignees].map { |assignee| assignee[:login] }
    end
  end
end
