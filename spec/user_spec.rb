require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    before(:each) do
      @user = User.create({ email: "test@test.com", first_name: "Victor", last_name: "Barreto", password: "123456", password_confirmation: "123456" })
    end
    it "Validates registration with all inputs filled" do
      expect(@user).to be_valid
    end
    it "Checks if password is at least 6 characters" do
      @user.password = "1234"
      @user.password_confirmation = "1234"
      expect(@user).to_not be_valid
    end
    it "Authenticates the users' email and password" do
      @user.password_digest = nil
      expect(@user).to_not be_valid
    end
    it "Ignores blank spaces before and after e-mails inputs" do
      @user.email = "  test@test.com  "
      expect(@user).to be_valid
    end
    it "Ignores uppercases on e-mails inputs" do
      @user.email = "TEST@test.com"
      expect(@user).to be_valid
    end
  end
end
