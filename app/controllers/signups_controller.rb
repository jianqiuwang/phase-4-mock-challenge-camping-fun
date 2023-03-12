class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def create
        signup = Signup.create!(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
        render json: signup.activity, status: :created
    end

    private
    def render_not_found
        render json: { error: "Signup not found" }, status: :not_found
      end
end
