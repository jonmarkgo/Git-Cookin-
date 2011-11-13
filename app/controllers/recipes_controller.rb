class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.xml
  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])
    @newrecipes = Recipe.find_all_by_parent_id(@recipe.id, :order => "id desc", :limit => 5)
    @toprecipes = Recipe.find_all_by_parent_id(@recipe.id, :order => "votes_up desc", :limit => 5)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    p = params
    @recipe = Recipe.new(:name => p[:recipename],
    :servings => p[:servings],
    :description => p[:description],
    :votes_down => 0,
    :votes_up => 0
    )
    
    steps = p[:step]
    steps.each_with_index do |step,index|
      if step == "" then next end
      
      puts "step #{step}"
      
      mStep = Step.new(:instruction => step, :sortnum => index)
      
      measurments = p["step"+String(index)+"measurement"]
      names = p["step"+String(index)+"ingredientname"]
      quantities = p["step"+String(index)+"quantity"]
      
      puts "measurments #{measurments}"
      puts "names #{names}"
      puts "quantity #{quantities}"
      
      if quantities == nil then next end
      
      quantities.each do |q|
        puts q
      end
      
      quantities.each_with_index do |mquantity,iindex|
        measurment = measurments[iindex]
        puts "measurment #{measurment}"
        puts "quantity #{mquantity}"
        
        id = Ingredient.find_or_create_by_name(names[iindex]).id
        ing = StepIngredient.new(:quanity => mquantity, :measurement => measurment, :ingredient_id => id)
        mStep.step_ingredients << ing
      end
      mStep.save!
      
      @recipe.steps << mStep
    end

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
    end
  end


#recipes/1/fork

def fork	
  Recipe.transaction do
    old = Recipe.find(params[:id])
    @recipe = old.dup
    @recipe.id = nil
    @recipe.parent = old
    @recipe.save!
    
    old.steps.each do |step|
      newStep = step.dup
      newStep.id = nil
      newStep.parent = step
      newStep.recipe = @recipe
      newStep.save!
      
      step.stepingredients.each do |si|
        newSi = si.dup
        newSi.id = nil
        newSi.parent = si
        newSi.step = newStep
        newSi.save!
      end
      
    end
    
    redirect_to(@recipe, :notice => 'Recipe was successfully forked.')
  end
end

end