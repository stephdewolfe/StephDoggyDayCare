class DogsController < ApplicationController

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


  private

  def dog_params
    params.required(:dog).permit(:name, :age, :breed)
  end

end