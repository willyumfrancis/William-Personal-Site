# app/controllers/search_controller.rb
class SearchController < ApplicationController
    def google
        query = params[:query]
        search_engine_id = "80523033ec3b94762"
        encoded_query = URI.encode(query)
        redirect_url = "https://cse.google.com/cse?cx=#{search_engine_id}&q=#{encoded_query}"
        logger.info "Redirecting to: #{redirect_url}"
        redirect_to redirect_url, allow_other_host: true
    rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
    end
end
