# app/controllers/transcriptions_controller.rb
require 'httparty'
require 'json'

class TranscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token # Skip CSRF check for API

  def create
    puts "Received request for transcription"
    
    audio_file = params[:audio]
    puts "Audio file: #{audio_file.inspect}"

    # Setting up model and response format
    model_name = "whisper-1"
    response_format = "json" # or "text" based on your needs
    
    begin
      response = HTTParty.post(
        'https://api.openai.com/v1/audio/transcriptions',
        headers: { "Authorization" => "Bearer #{ENV['WHISPER_API_KEY']}" },
        body: { 
          file: audio_file.read,
          model: model_name,  # Enclosed in quotes
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
    rescue HTTParty::Error => e
      puts "HTTParty Error: #{e.message}"
      render json: { error: "HTTParty Error: #{e.message}" }, status: :bad_request
    rescue StandardError => e
      puts "Standard Error: #{e.message}"
      render json: { error: "Standard Error: #{e.message}" }, status: :bad_request
    end
  end
end
