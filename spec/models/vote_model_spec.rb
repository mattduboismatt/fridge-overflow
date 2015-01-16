describe 'Vote' do

  let(:vote) { Vote.create!(
                          vote_value: -1
                          )}

  it 'should have a value attribute' do
    expect(vote.vote_value).to eq(-1)
  end

  it 'should belong to a user' do
    expect(vote).to belong_to(:user)
  end

    it 'should belong to votable' do
    expect(vote).to belong_to(:votable)
  end

end
