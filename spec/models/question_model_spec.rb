describe 'Question' do

  let(:question) { Question.create!(
                                    title: 'example',
                                    content: 'example@test.com',
                                    visit_count: 100)}

  it 'should have a title' do
    expect(question.title).to eq('example')
  end

  it 'should have email attribute' do
    expect(question.content).to eq('example@test.com')
  end

  it 'should have password attribute' do
    expect(question.visit_count).to eq(100)
  end

  it 'should belong to a user' do
    expect(question).to belong_to(:user)
  end

  it 'should have many taggings' do
    expect(question).to have_many(:taggings)
  end

  it 'should have many answers' do
    expect(question).to have_many(:answers)
  end

    it 'should have one best_answer' do
    expect(question).to have_one(:best_answer)
  end

  it 'should have many tags' do
    expect(question).to have_many(:tags)
  end

  it 'should have many votes' do
    expect(question).to have_many(:votes)
  end

    it 'should have many responses' do
    expect(question).to have_many(:responses)
  end

end