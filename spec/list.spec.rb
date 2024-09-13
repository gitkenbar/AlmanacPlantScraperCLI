require_relative '../lib/list.rb'

RSpec.describe List do
    before do 
        List.make_list 
    end

    
    describe 'Index changed at:' do
        it 'vegetables' do
        expect(List.index_check('vegetables')).to eq(0)
        end
        it 'fruits' do
        expect(List.index_check('fruits')).to eq(51)
        end
        it 'herbs' do
        expect(List.index_check('herbs')).to eq(72)
        end
        it 'flowers' do
        expect(List.index_check('flowers')).to eq(87)
        end
        it 'foliage' do
        expect(List.index_check('foliage')).to eq(151)
        end
        it 'woody plants' do
        expect(List.index_check('woody_plant')).to eq(157)
        end
        it 'houseplants' do
        expect(List.index_check('houseplants')).to eq(187)
        end
    end


    describe 'Categorize Plants' do
        it 'adds vegetables to array' do
            vegetable_array = List.array_check('vegetables')
            expect(vegetable_array[1].text).to eq('Arugula')
            expect(vegetable_array[-1].text).to eq('Zucchini (Summer Squash)')
        end
        it 'adds fruits to array' do
            fruits_array = List.array_check('fruits')
            expect(fruits_array[1].text).to eq('Blackberries')
            expect(fruits_array[-1].text).to eq('Watermelons')
        end
        it 'adds herbs to array' do
            herbs_array = List.array_check('herbs')
            expect(herbs_array[1].text).to eq('Cannabis')
            expect(herbs_array[-1].text).to eq('Thyme')
        end
        it 'adds flowers to array' do
            flower_array = List.array_check('flowers')
            expect(flower_array[1].text).to eq('Amaryllis')
            expect(flower_array[-1].text).to eq('Zinnias')
        end
        it 'adds foliage to array' do
            foliage_array = List.array_check('foliage')
            expect(foliage_array[1].text).to eq('Caladiums')
            expect(foliage_array[-1].text).to eq('Hostas')
        end
        it 'adds woody plants to array' do
            woody_array = List.array_check('woody')
            expect(woody_array[1].text).to eq('Butterfly Bushes')
            expect(woody_array[-1].text).to eq('Christmas Cactus')
        end
        it 'adds houseplants to array' do
            houseplant_array = List.array_check('houseplants')
            expect(houseplant_array[1].text).to eq('Air Plants (Tillandsia)')
            expect(houseplant_array[-1].text).to eq('Wisteria')
        end
    end
end

