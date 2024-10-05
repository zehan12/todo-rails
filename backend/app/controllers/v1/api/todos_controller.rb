class V1::Api::TodosController < ApplicationController
  before_action :set_todo, only: %i[ show update destroy ]

  # GET /api/todos
  def index
    @todos = Todo.all

    render json: @todos
  end

  # GET /api/todos/1
  def show
    render json: @todo
  end

  # POST /api/todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/todos/1
  def destroy
    @todo.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:todo_name, :completed)
    end
end
