
    # app/controllers/transcriptions_controller.rb
require 'httparty'

class TranscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token # Skip CSRF check for API

  def create
    audio_file = params[:audio]
    response = HTTParty.post(
      'https://api.openai.com/v1/whisper/asr',
      headers: { "Authorization" => "Bearer your-whisper-api-key" },
      body: { file: audio_file.read }
    )
    if response.code == 200
      transcription = JSON.parse(response.body)['transcription']
      render json: { transcription: transcription }, status: :ok
    else
      render json: { error: 'Failed to transcribe audio' }, status: :bad_request
    end
  end
end
