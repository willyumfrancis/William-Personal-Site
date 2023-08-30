
    # app/controllers/transcriptions_controller.rb
require 'httparty'

class TranscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token # Skip CSRF check for API

  def create
    puts "Received request for transcription" # Debugging line

    audio_file = params[:audio]
    puts "Audio file: #{audio_file}" # Debugging line to print the audio file object

    response = HTTParty.post(
      'https://api.openai.com/v1/whisper/asr',
      headers: { "Authorization" => "Bearer #{ENV['WHISPER_API_KEY']}" },
      body: { file: audio_file.read }
    )

    puts "Whisper API response: #{response.body}" # Debugging line to print the API response

    if response.code == 200
      transcription = JSON.parse(response.body)['transcription']
      puts "Transcription successful: #{transcription}" # Debugging line

      render json: { transcription: transcription }, status: :ok
    else
        puts "Failed to transcribe audio, status code: #{response.code}" # Debugging line

      render json: { error: 'Failed to transcribe audio' }, status: :bad_request
    end
  end
end
