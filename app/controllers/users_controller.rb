class UsersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
    

    def show
        user = find_user
        render json: user, except: [:created_at, :updated_at], include: :items
    end



    private
    def find_user
        User.find_by(id: params[:id])
    end

    def record_not_found_response
        render json: { error: "user not found" }, status: :not_found
    end
end
