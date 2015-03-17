require 'acceptance_helper'

feature 'Add compulsories', %q{
  In order to add new figures to list
  As an user
  I want to add figure
} do

    given(:compulsory) { create(:compulsory)}
    given(:image_file) { "#{Rails.root}/spec/support/files/image.png" }

    background do
        visit compulsories_path
        click_on 'New compulsory'
    end

    scenario 'with valid name and code' do
        fill_in 'Name', with: 'Compulsory'
        fill_in 'Code', with: 'DI01'

        all("input[type='file']")[0].set(image_file)

        click_on 'Create Compulsory'

        expect(page).to have_content 'Compulsory was successfully created.'
        expect(page).to have_content 'Compulsory'
        expect(page).to have_content 'DI01'
        expect(page).to have_xpath '//img[@src="/uploads/compulsory/image/1/image.png"]'
    end

    scenario 'with invalid name and code' do
        fill_in 'Name', with: ''
        fill_in 'Code', with: ''
        all("input[type='file']")[0].set('')
        click_on 'Create Compulsory'

        within '.compulsory_name' do
            expect(page).to have_content "can't be blank"
        end

        within '.compulsory_code' do
            expect(page).to have_content "can't be blank"
        end

        within '.compulsory_image' do
            expect(page).to have_content "can't be blank"
        end
    end
end

