describe 'Response' do

  let(:response) { Response.create!(
                                  content: "test"
                                  ) }

  it 'should have content' do
    expect(response.content).to eq("test")
  end

  it 'should belong to a response' do
    expect(response).to belong_to(:responsive)
  end

    it 'should belong to a user' do
    expect(response).to belong_to(:user)
  end

  it 'should have many votes' do
    expect(response).to have_many(:votes)
  end

end
