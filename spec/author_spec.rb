require './game/author'

describe Author do
    context '#add_item' do
      it 'returns correct First name' do
        author = Author.new('Musong', 'Akeh')
        expect(author.first_name).to eq('Musong')
      end  
      it 'returns correct Last name' do
        author = Author.new('Musong', 'Akeh')
        expect(author.last_name).to eq('Akeh')
      end  
    end
end