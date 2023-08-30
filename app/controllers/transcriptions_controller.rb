# app/controllers/transcriptions_controller.rb

class TranscriptionsController < ApplicationController
    skip_before_action :verify_authenticity_token # Skip CSRF check for API
  
    def create
      puts "Received request for transcription"
  
      audio_file = params[:audio]
      puts "Audio file: #{audio_file.inspect}"
  
      client = OpenAI::Client.new  # Initializes the OpenAI client
  
      # Transcribe audio using the 'whisper-1' model
      response = client.audio.transcribe(
        parameters: {
          model: "whisper-1",
          file: audio_file.tempfile
        }
      )
  
      puts "Whisper API response: #{response['text']}"
  
      # You can now send this response to your iOS app as a note.
      if response["text"].present?
        render json: { transcription: response["text"] }, status: :ok
      else
        puts "Failed to transcribe audio"
        render json: { error: 'Failed to transcribe audio' }, status: :bad_request
      end
    end
  end
  