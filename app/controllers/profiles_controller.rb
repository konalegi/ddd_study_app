class ProfilesController < ApplicationController
  def create
    op = Profile::Create.(params)
    render json: op.profile
  end

  def add_car
    op = Profile::AddCar.(params)
    render json: op.profile
  end
end