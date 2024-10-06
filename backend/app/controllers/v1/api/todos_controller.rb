class V1::Api::TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy, :update_completed]

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

  # PATCH v1/api/todos/1/updated_completed
  def update_completed
      if params[:completed].present? && @todo.update(completed: params[:completed])
        render json: @todo, status: :ok
      else
        render json: { error: "The 'completed' parameter passed as false or missing" }, status: :unprocessable_entity
      end
  end

  # PUT v1/api/todos/1
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

# x = {"a": "yello", "b": "green"}   "1104"
# x["a"]                                "1165"


# x = {a: "yello", b: "green"}
# x= {:a => "yello", :b => "green"}

# x[:a]
# x.a

# y = x.with_indifference_access


# "a"