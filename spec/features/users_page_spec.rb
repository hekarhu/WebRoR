require 'rails_helper'
include Helpers

describe "User" do

  let!(:user){FactoryGirl.create :user}
  let!(:user1){FactoryGirl.create :user ,username:"henri", password:"Testi22", password_confirmation:"Testi22"}
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:rating){ FactoryGirl.create :rating, beer:beer1, user:user}
  let!(:rating2){ FactoryGirl.create :rating, beer:beer1, user:user1}

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(username:"Pekka", password:"Foobar1")
      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username:"Pekka", password:"Fooba")
      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'Username and/or password mismatch'
      #save_and_open_page
    end
  end

  describe "signed up and" do
   it "when signed up with good credentials, is added to the system" do
    visit signup_path
    fill_in('user_username', with:'Brian')
    fill_in('user_password', with:'Secret55')
    fill_in('user_password_confirmation', with:'Secret55')

    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
  end
end

describe "is signed up and" do
  it "signs in, page shows ratings" do
      sign_in(username:"Pekka", password:"Foobar1")
      expect(page).to have_content "Has made 1 ratings"
      expect(page).to have_content "iso 3 10"
      #save_and_open_page
  end
  it "can destroy own rating" do
      sign_in(username:"Pekka", password:"Foobar1")
      expect(user.ratings.count).to eq(1)
      click_on("delete")
      expect(user.ratings.count).to eq(0)
      #save_and_open_page
  end
 end
end

