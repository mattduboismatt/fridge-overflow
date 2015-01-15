describe 'Answer' do

  let(:answer) { Answer.create!(
                                content: 'example@test.com'
                                )}
ß
  it 'should have content attribute' do
    expect(answer.content).to eq('example@test.com')
  end

  it 'should belong to a user' do
    expect(answer).to belong_to(:user)
  end

    it 'should belong to a question' do
    expect(answer).to belong_to(:question)
  end

  it 'should have many votes' do
    expect(answer).to have_many(:votes)
  end

    it 'should have many responses' do
    expect(answer).to have_many(:responses)
  end

end
