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
    it 'Test for add item method' do
      author = Author.new('Musong', 'Akeh')
      item = double('Item')
      allow(item).to receive(:publish_date) { '2020-02-02' }
      allow(item).to receive(:author=)
      author.add_item(item)
      expect(author.items[0].publish_date).to eq('2020-02-02')
    end
  end
end
