class SearchController < ApplicationController
    def google
        query = params[:query]
        search_engine_id = "80523033ec3b94762"
        encoded_query = URI.encode(query)
        redirect_to "https://cse.google.com/cse?cx=#{search_engine_id}&q=#{encoded_query}", allow_other_host: true
    rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
        # Optionally, render a custom error page
        # render 'error_page'
    end
end
