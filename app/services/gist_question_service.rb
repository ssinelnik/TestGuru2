# frozen_string_literal: true

ResultObject = Struct.new(:success?, :html_url, :id)

class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    ResultObject.new(response.html_url.present?, response.html_url, response.id)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ACCESS_TOKEN_GIT_HUB)
  end

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
