# app/controllers/transcriptions_controller.rb
require 'httparty'

class TranscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token # Skip CSRF check for API

  def create
    puts "Received request for transcription"
    
    audio_file = params[:audio]
    puts "Audio file: #{audio_file.inspect}"

    # Setting up model and response format
    model_name = "whisper-1"
    response_format = "json" # or "text" based on your needs
    
    response = HTTParty.post(
      'https://api.openai.com/v1/whisper/asr', # Confirm this URL is correct
      headers: { "Authorization" => "Bearer #{ENV['WHISPER_API_KEY']}" },
      body: { 
        file: audio_file.read,
        model: model_name,
        response_format: response_format
      }
    )

    puts "Whisper API response: #{response.body}"

    if response.code == 200
      transcription = JSON.parse(response.body)['text'] # Adjust based on actual response key
      render json: { transcription: transcription }, status: :ok
    else
      puts "Failed to transcribe audio, status code: #{response.code}"
      render json: { error: 'Failed to transcribe audio' }, status: :bad_request
    end
  end
end
