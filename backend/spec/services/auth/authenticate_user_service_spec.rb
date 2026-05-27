require "rails_helper"

RSpec.describe Auth::AuthenticateUserService do
  describe ".call" do
    let!(:user) { create(:user, email: "test@example.com", password: "password123") }

    context "with valid credentials" do
      it "returns Success with token and user" do
        result = described_class.call(email: "test@example.com", password: "password123")

        expect(result).to be_success
        expect(result.value![:token]).to be_present
        expect(result.value![:user][:email]).to eq("test@example.com")
      end
    end

    context "with wrong password" do
      it "returns Failure" do
        result = described_class.call(email: "test@example.com", password: "wrongpass")

        expect(result).to be_failure
        expect(result.failure).to include("Invalid email or password")
      end
    end

    context "with unknown email" do
      it "returns Failure" do
        result = described_class.call(email: "ghost@example.com", password: "password123")

        expect(result).to be_failure
      end
    end
  end
end
