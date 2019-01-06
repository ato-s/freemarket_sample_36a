class ViewtestController < ApplicationController
  layout "single", only: [:login, :signup, :sell]
  def index; end
  def login; end
  def signup; end
  def signup_registration; end
end
