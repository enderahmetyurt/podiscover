# frozen_string_literal: true

class OpenaiService
  URL = "https://api.openai.com/v1/completions"

  def self.call(user, prompt)
    data = {
      model: "text-davinci-003",
      prompt: prompt,
      temperature: 0.6,
      max_tokens: 4000,
      top_p: 1,
      frequency_penalty: 1,
      presence_penalty: 1
    }
    headers = {"Content-Type" => "application/json", "Authorization" => "Bearer #{ENV["OPENAI_TOKEN"]}"}
    request = user.openai_requests.build(prompt:)

    begin
      response = RestClient.post(URL, data.to_json, headers:)
      body = JSON.parse(response)

      if body.present? && body["choices"].any?
        result = body["choices"].first["text"]
        user.decrement!(:daily_openai_credit)
        request.result = result
        request.status = true
        request.save!

        result
      else
        t("openai.results.no_answer")
      end
    rescue
      t("openai.results.error")
    end
  end
end
