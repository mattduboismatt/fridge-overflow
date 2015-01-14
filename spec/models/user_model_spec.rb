describe 'User' do
  let(:user) { User.new(username: 'example', email: 'example@test.com') }
  it 'has a username attribute' do
    expect(user.username).to eq('example')
  end
end
