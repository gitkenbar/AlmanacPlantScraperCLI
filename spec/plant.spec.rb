require_relative '../lib/list.rb'
require_relative '../lib/plant.rb'
require_relative '../lib/menu.rb'

RSpec.shared_examples "plants" do |plant|

end

RSpec.describe Plant do
    # This will cycle through all the plants on from the list and evaluate whether their articles have sections
    
    # Makes the list of plants to be cycled through

    List.make_list 
    plant_array = List.array_check('foliage')
    plant_array.each do |plant|
        puts plant
        Menu.choose_option(`#{plant}`)
        describe plant.text do
            #it 'has Article-Main' do
            #    expect(Plant.check_article('main')).to eq(true)
            #end

            #it 'has Article-Planting' do
            #    expect(Plant.check_article('planting')).to eq(true)
            #end
            #it 'has Article-Care' do
            #    expect(Plant.check_article('care')).to eq(true)
            #end
            #it 'has Article-Varieties' do
            #    expect(Plant.check_article('varieties')).to eq(true)
            #end
            it 'has Article-Pests' do
                expect(Plant.check_article('pests')).to eq(true)
            end
        end
    end
end