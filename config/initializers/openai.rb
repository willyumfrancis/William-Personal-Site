OpenAI.configure do |config|
    config.access_token = ENV.fetch("WHISPER_API_KEY")
    # Optional: if you belong to multiple organizations
    # config.organization_id = ENV.fetch("OPENAI_ORGANIZATION_ID")
  end
  