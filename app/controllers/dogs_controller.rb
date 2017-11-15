class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end
# we need to create a new space for the form entries.
  def create
    @dog =Dog.new(dog_params)
# if it saves with the new dog info, send to index.
    if @dog.save
    redirect_to dogs_url, notice: 'successfully saved.'
      else
# if it doesnt save, bring me back to form view (re-render new dog form)
 flash.now[:notice] = "Something went wrong. We couldn't save your dog...."
render :new


   end
 end

def show
end

def edit
end

def update

  if @dog.update(dog_params)
  redirect_to dog_url(@dog), notice: 'successful updated!'

  else flash.now[:notice] = "something went wrong, we couldn't update #{@dog.name}."
  render :edit
  end
end

def destroy
  if @dog.destroy
    redirect_to dogs_url, notice: "Successfully deleted #{@dog.name}"
  else

    redirect_to dogs_url, notice: "Could not delete #{@dog.name}"
  end
end

 private

  def dog_params
    params.required(:dog).permit(:name, :age, :breed, :owner_id)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

end