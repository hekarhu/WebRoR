require 'rails_helper'
describe "Beer" do
    before :each do
      @breweries = ["Koff"]
      year = 1896
      @breweries.each do |brewery_name|
        FactoryGirl.create(:brewery, name: brewery_name, year: year)
	FactoryGirl.create(:user)
        sign_in(username:"Pekka", password:"Foobar1")
      visit new_beer_path
      end
end
it "is created when name is filled" do

    fill_in('beer_name', with:'testi')
    select('Koff', from:'beer[brewery_id]')
        expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(1)
#    save_and_open_page
#    expect(page).to have_content 'Listing Beers'
#    expect(page).to have_content 'testi' 
#    expect(page).to have_content 'Beer was successfully created'
  end
it "is not created when name is not filled" do

    select('Koff', from:'beer[brewery_id]')
        expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(0)
    #save_and_open_page
    expect(page).to have_content 'Name can\'t be blank'
end


end
