class SearchController < ApplicationController
    def google
        query = params[:query]
        search_engine_id = "80523033ec3b94762"
        # Ensure the query is URL-encoded to prevent issues with special characters
        encoded_query = URI.encode(query)
        redirect_to "https://cse.google.com/cse?cx=#{search_engine_id}&q=#{encoded_query}", allow_other_host: true
    end
end
