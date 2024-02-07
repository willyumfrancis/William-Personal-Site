# app/controllers/builds_controller.rb

class BuildsController < ApplicationController
    def show
      @build_id = params[:build_id].to_s
    end
  end
  