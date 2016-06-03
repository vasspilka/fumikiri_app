RSpec.describe UserRepository do
  let(:params) { Hash(name: 'Bob', role: 'role:admin', jti: 'd2e9c5ea-30af-4c81-b4c4-7c864311db67') }
  let!(:user) { UserRepository.new.create(User.new(params)) }

  describe "created user has his attributes" do
    subject { user }
    after { UserRepository.new.clear }
    its(:name) { is_expected.to eq 'Bob' }
    its(:role) { is_expected.to eq 'role:admin' }
    its(:jti)  { is_expected.to eq 'd2e9c5ea-30af-4c81-b4c4-7c864311db67' }
  end

  describe "user persisted" do
    after { UserRepository.new.clear }
    it "repository has exacly one user" do
      expect(UserRepository.new.all.count).to eq 1
    end
  end

end
