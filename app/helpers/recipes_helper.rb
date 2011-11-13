module RecipesHelper
	def mini_diff(childRecipe)
    @parentRecipe = childRecipe.parent
    
    parentHash = {}
    @parentRecipe.steps.each do |step|
      step.step_ingredients.each do |si|
        parentHash[step.id.to_s+"_"+si.id.to_s] = si
      end
    end
    
    @diff = []
    
    childRecipe.steps.each do |step|
      step.step_ingredients.each do |si|
        orgStep = parentHash[String(step.parent_id)+"_"+String(si.parent_id)] 
        if orgStep == nil #Addition
          @diff << "Added #{si.quanity} #{si.measurement} #{si.ingredient.name}"
        elsif orgStep.quanity != si.quanity
          @diff << "Changed #{si.ingredient.name} to #{si.quanity} #{si.measurement}"
          parentHash.delete(String(step.parent_id)+"_"+String(si.parent_id))
        elsif orgStep.measurement != si.measurement
          @diff << "Changed #{si.measurement} to #{si.measurement}"
          parentHash.delete(String(step.parent_id)+"_"+String(si.parent_id))
        else #Nothing changed
          parentHash.delete(String(step.parent_id)+"_"+String(si.parent_id))          
        end
      end
    end
    
    parentHash.each do |key, value| 
       @diff << "Deleted #{value.ingredient.name}"
    end
    return @diff
end
end
