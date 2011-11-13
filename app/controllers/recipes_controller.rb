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
    @recipe = Recipe.new(params[:recipe])

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


#recipes/1/diff
def diff
    @childRecipe = Recipe.find(params[:id])
    @parentRecipe = @childRecipe.parent
    
    parentHash = {}
    @parentRecipe.steps.each do |step|
      step.step_ingredients.each do |si|
        parentHash[step.id.to_s+"_"+si.id.to_s] = si
      end
    end
    
    @diff = []
    
    @childRecipe.steps.each do |step|
      step.step_ingredients.each do |si|
        orgStep = parentHash[String(step.parent_id)+"_"+String(si.parent_id)] 
        if orgStep == nil #Addition
          @diff << "Added #{si.quanity} #{si.measurement} of #{si.ingredient.name}"
        elsif orgStep.quanity != si.quanity
          @diff << "Modified #{si.ingredient.name} to #{si.quanity} #{si.measurement}"
          parentHash.delete(String(step.parent_id)+"_"+String(si.parent_id))
        elsif orgStep.measurement != si.measurement
          @diff << "Modified #{si.measurement} to #{si.measurement}"
          parentHash.delete(String(step.parent_id)+"_"+String(si.parent_id))
        else #Nothing changed
          parentHash.delete(String(step.parent_id)+"_"+String(si.parent_id))          
        end
      end
    end
    
    parentHash.each do |key, value| 
       @diff << "Deleted #{value.ingredient.name}"
    end
    
    respond_to do |format|
      format.html {  render :action => "diff" }
    end
end

end