class HomePageController < ApplicationController
  def show


    count = Recipe.count

#    @recipes = Recipe.all  
    @newrecipes= Recipe.order("created_at DESC" ).limit(5)
    @toprecipes = Recipe.order("votes_up DESC").limit(5)
   
   respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end 


  end

 
end
