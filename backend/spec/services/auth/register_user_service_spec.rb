require "rails_helper"

RSpec.describe Auth::RegisterUserService do
  describe ".call" do
    let(:valid_params) { { email: "new@example.com", password: "password123", password_confirmation: "password123" } }

    context "with valid params" do
      it "returns Success with token and user" do
        result = described_class.call(params: valid_params)

        expect(result).to be_success
        expect(result.value![:token]).to be_present
        expect(result.value![:user][:email]).to eq("new@example.com")
      end

      it "creates the user in the database" do
        expect { described_class.call(params: valid_params) }.to change(User, :count).by(1)
      end
    end

    context "with invalid params" do
      it "returns Failure with error messages for duplicate email" do
        create(:user, email: "new@example.com")

        result = described_class.call(params: valid_params)

        expect(result).to be_failure
        expect(result.failure).to be_present
      end

      it "returns Failure for short password" do
        result = described_class.call(params: valid_params.merge(password: "short"))

        expect(result).to be_failure
      end
    end
  end
end
