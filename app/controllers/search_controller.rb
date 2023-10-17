# app/controllers/search_controller.rb
class SearchController < ApplicationController
    def google
        query = params[:query]
        search_engine_id = "a6ccd2b24e9284464"  # Updated search engine ID
        encoded_query = URI.encode(query)
        redirect_url = "https://cse.google.com/cse?cx=#{search_engine_id}&q=#{encoded_query}"
        redirect_to redirect_url, allow_other_host: true
    rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
        render plain: "An error occurred: #{e.message}", status: 500
    end
end
