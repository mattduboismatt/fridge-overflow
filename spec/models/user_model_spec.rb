describe 'User' do

  let(:user) { User.create!(username: 'example',
                            email: 'example@test.com',
                            password: 'password',
                            website: 'wwwww@eeee.com',
                            location: 'chicago',
                            age: 100,
                            real_name: 'Seaman')}

  it 'should have username attribute' do
    expect(user.username).to eq('example')
  end

  it 'should have email attribute' do
    expect(user.email).to eq('example@test.com')
  end

  it 'should have password attribute' do
    expect(user.password).to eq('password')
  end

  it 'should have a website' do
    expect(user.website).to eq('wwwww@eeee.com')
  end

  it 'should have an age' do
    expect(user.age).to eq(100)
  end

  it 'should have a real_name' do
    expect(user.real_name).to eq('Seaman')
  end

  it 'should have questions' do
    expect(user).to have_many(:questions)
  end

  it 'should have responses' do
    expect(user).to have_many(:responses)
  end

  it 'should have votes' do
    expect(user).to have_many(:votes)
  end

  it 'should have answers' do
    expect(user).to have_many(:answers)
  end



end
