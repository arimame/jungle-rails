require 'rails_helper'

RSpec.describe User, type: :model do
   subject { described_class.new(first_name: "alissa", last_name: "balge", email: "alissa@alissa.com", password: "some_password", password_confirmation: "some_password") }



   it "is valid if both password and password_confirmation are valid" do
   expect(subject).to be_valid
 end

  it "is not valid if both passwords don't match" do
    subject.password = "password"
   expect(subject.password).to_not match(subject.password_confirmation)
 end

  it "is not valid if email is not unique" do
    subject.save!
    u = User.new(first_name: "alissa", last_name: "balge", email: "ALISSA@ALISSA.com", password: "some_password", password_confirmation: "some_password")
    u.valid?
    expect(u.errors[:email]).to include("has already been taken")
  end

  it "is not valid if first_name is not valid" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

   it "is not valid if last_name is not valid" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

   it "is not valid if email is not valid" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the password is too short" do
    subject.password = "hi"
    subject.password_confirmation = "hi"
    subject.valid?
    expect(subject.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  describe '.authenticate_with_credentials' do
    it "it should check if the password and email is valid" do
      subject.save!
      expect(User.authenticate_with_credentials(subject.email, subject.password)).to be_valid
    end

      it "it should not valid if the password is wrong" do
      subject.save!
      expect(User.authenticate_with_credentials(subject.email, "wrong67")).to be_nil
    end


      it "it should not valid if the email does not exist" do
      subject.save!
      expect(User.authenticate_with_credentials("notarealemail@lol.com", subject.password)).to be_nil
    end
  end
end