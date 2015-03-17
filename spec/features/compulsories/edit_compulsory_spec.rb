require 'acceptance_helper'

feature 'Edit compulsories', %q{
  In order to change compulsories information
  As an user
  I want to edit compulsory
} do

    given!(:compulsory) { create(:compulsory)}

    context 'update compulsory', js: true do
        background { visit edit_compulsory_path(compulsory) }

        scenario 'from list' do
            visit compulsories_path

            expect(page).to have_link('Edit', href: edit_compulsory_path(compulsory))
        end

        scenario 'from details' do
            visit compulsory_path(compulsory)

            expect(page).to have_link('Edit', href: edit_compulsory_path(compulsory))
        end

        scenario 'with valid name and code' do
            fill_in 'Name', with: 'New Name'
            fill_in 'Code', with: 'NC01'
            fill_in 'Description', with: 'Compulsory description'

            click_on 'Update Compulsory'

            expect(page).to have_content 'Compulsory was successfully updated'
            expect(page).to have_content 'New Name'
            expect(page).to have_content 'NC01'
            expect(page).to have_content 'Compulsory description'
        end

        scenario 'with invalid name and code' do
            fill_in 'Name', with: ''
            fill_in 'Code', with: ''

            click_on 'Update Compulsory'

            within '.compulsory_name' do
                expect(page).to have_content "can't be blank"
            end

            within '.compulsory_code' do
                expect(page).to have_content "can't be blank"
            end
        end
    end
end

