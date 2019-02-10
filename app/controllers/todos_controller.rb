class TodosController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_todo_and_information
  def index
  end
end
