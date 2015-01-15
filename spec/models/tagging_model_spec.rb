describe 'Tagging' do

  let(:tagging) { Tagging.create! }

  it 'should belong to a question' do
    expect(tagging).to belong_to(:question)
  end

    it 'should belong to a tag' do
    expect(tagging).to belong_to(:tag)
  end

end
