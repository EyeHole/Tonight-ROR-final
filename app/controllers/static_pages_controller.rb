# frozen_string_literal: true

# Controller class for not-model pages
class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: %i[profile user_events user_visitor], raise: false

  def home; end

  def about; end

  def profile
    @user = current_user
  end

  def user_events
    @events = Event.where(user_id: current_user.id)
  end

  def user_visitor
    user_as_visitor = Visitor.where(user_id: current_user.id)
    @events = user_as_visitor.map do |visitor|
      Event.find_by(id: visitor.event_id)
    end
  end
end
