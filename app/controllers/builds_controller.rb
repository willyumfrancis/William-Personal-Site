# app/controllers/builds_controller.rb

class BuildsController < ApplicationController
    def show
      @build_id = params[:id]
  
      # You can use @build_id to fetch specific data for each build from the database if needed
    end
  end
  