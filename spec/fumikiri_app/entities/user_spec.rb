RSpec.describe User do
  let(:params) { Hash(name: 'Bob', role: 'role:admin', jti: 'd2e9c5ea-30af-4c81-b4c4-7c864311db67') }
  let(:user) { User.new(params) }

  describe "attributes" do
    subject { user }
    its(:name) { is_expected.to eq 'Bob' }
    its(:role) { is_expected.to eq 'role:admin' }
    its(:jti)  { is_expected.to eq 'd2e9c5ea-30af-4c81-b4c4-7c864311db67' }
  end
end
