class TodosController < ApplicationController

  before_action :set_todo, only: [:edit, :update, :show, :destroy ]
  
  
  def new
    @todo = Todo.new
  end
  
  def create
  @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "To do was created succesfully!"
      redirect_to todo_path(@todo)
    else 
      render 'new'
    end  
  end
  
  def show
    #@todo = Todo.find(params[:id])
  end
  
  def edit
    #@todo = Todo.find(params[:id])
  end
  
  def update
    #@todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "Todo was succesfully updated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
  
  def index
  @todos = Todo.all
  end
  
  def destroy
    #@todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = "Todo was delited succesfully"
    redirect_to todos_path
  end
  
  
  
private 

def set_todo
  @todo = Todo.find(params[:id])
end

  def todo_params
  params.require(:todo).permit(:name, :description)  
  end
  

end
