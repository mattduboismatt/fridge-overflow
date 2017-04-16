describe 'Tag' do

  let(:tag) { Tag.create!(
                          name: 'example@test.com'
                          )}

  it 'should have name attribute' do
    expect(tag.name).to eq('example@test.com')
  end

  it 'should have many taggings' do
    expect(tag).to have_many(:taggings)
  end

    it 'should have many questions' do
    expect(tag).to have_many(:questions)
  end

end
