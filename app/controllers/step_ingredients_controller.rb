class StepIngredientsController < ApplicationController
  # GET /step_ingredients
  # GET /step_ingredients.xml
  def index
    @step_ingredients = StepIngredient.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @step_ingredients }
    end
  end

  # GET /step_ingredients/1
  # GET /step_ingredients/1.xml
  def show
    @step_ingredient = StepIngredient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @step_ingredient }
    end
  end

  # GET /step_ingredients/new
  # GET /step_ingredients/new.xml
  def new
    @step_ingredient = StepIngredient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @step_ingredient }
    end
  end

  # GET /step_ingredients/1/edit
  def edit
    @step_ingredient = StepIngredient.find(params[:id])
  end

  # POST /step_ingredients
  # POST /step_ingredients.xml
  def create
    @step_ingredient = StepIngredient.new(params[:step_ingredient])

    respond_to do |format|
      if @step_ingredient.save
        format.html { redirect_to(@step_ingredient, :notice => 'Step ingredient was successfully created.') }
        format.xml  { render :xml => @step_ingredient, :status => :created, :location => @step_ingredient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @step_ingredient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /step_ingredients/1
  # PUT /step_ingredients/1.xml
  def update
    @step_ingredient = StepIngredient.find(params[:id])

    respond_to do |format|
      if @step_ingredient.update_attributes(params[:step_ingredient])
        format.html { redirect_to(@step_ingredient, :notice => 'Step ingredient was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @step_ingredient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /step_ingredients/1
  # DELETE /step_ingredients/1.xml
  def destroy
    @step_ingredient = StepIngredient.find(params[:id])
    @step_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to(step_ingredients_url) }
      format.xml  { head :ok }
    end
  end
end
