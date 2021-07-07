class ApplicationController < ActionController::API

    # Verify if the desired parameters exist
    #
    # params [:list_desired_params, :current_params]
    def exist_params?(should_exist, params_to_check)

        params_missing = []
        should_exist.map{|key| params_missing.push(key) unless params_to_check.key? key}

        unless params_missing.empty?
            render json: { error: "Missing parameters #{params_missing}"}, status: :bad_request 
            false
        else
            true
        end

    end
end
