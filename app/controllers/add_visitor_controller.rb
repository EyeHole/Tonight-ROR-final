# frozen_string_literal: true

# Controller class for Visitor model usage
class AddVisitorController < ApplicationController
  before_action :authenticate_user!, raise: false

  def event_registration
    if Visitor.find_by(user_id: current_user.id, event_id: params[:event_id]).nil?
      @visitor = Visitor.new(user_id: current_user.id, event_id: params[:event_id])
      @visitor.save

      @error = false
    else
      @error = true
    end
  end
end
