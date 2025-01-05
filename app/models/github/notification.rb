module Github
  class Notification
    include ActiveModel::Model
    attr_accessor :issue

    def initialize(issue)
      @issue = issue
    end

    def id
      issue[:id]
    end

    def title
      issue[:subject][:title]
    end

    def url
      issue[:subject][:url]&.gsub("api.github.com/repos", "github.com")&.gsub("/pulls/", "/pull/")
    end

    def unread?
      issue[:unread]
    end

    def reason
      issue[:reason]
    end

    def reason_color
      case reason
      when "comment"
        "bg-blue-500"
      when "assign"
        "bg-purple-500"
      when "state_change"
        "bg-red-500"
      else
        "bg-gray-500"
      end
    end

    def repository_name
      issue[:repository][:full_name]
    end

    def updated_at
      issue[:updated_at]
    end

    def last_read_at
      issue[:last_read_at]
    end

    def type
      issue[:subject][:type]
    end
  end
end
