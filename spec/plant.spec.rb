require_relative '../lib/list.rb'
require_relative '../lib/plant.rb'

RSpec.describe Plant do
    # This will cycle through all the plants on from the list and evaluate whether their articles have sections

    before do 
        # Makes the list of plants to be cycled through
        List.make_list 
    end

    
end