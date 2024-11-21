module Github
  class Client
    include ActiveModel::Model
    attr_accessor :client

    delegate_missing_to :client

    def initialize
      @client = ::Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    end
  end
end
