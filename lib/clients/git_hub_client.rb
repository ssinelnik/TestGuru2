class GitHubClient
  ROOT_ENDPONT = 'https://api.github.com'
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initalize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPONT)
  end
end