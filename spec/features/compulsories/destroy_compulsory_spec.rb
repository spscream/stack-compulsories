require 'acceptance_helper'

feature 'Add compulsories', %q{
  In order to remove figures from list
  As an user
  I want to remove figure
} do

    given!(:compulsory) { create(:compulsory)}

    scenario 'remove compulsory from list', js: true do
        visit compulsories_path

        click_on 'Destroy'

        expect(page).to have_content 'Compulsory was successfully destroyed'
        expect(page).to_not have_content(compulsory.name)
    end

    scenario 'remove from details', js: true do
        visit compulsory_path(compulsory)

        click_on 'Destroy'

        expect(page).to have_content 'Compulsory was successfully destroyed'
        expect(page).to_not have_content(compulsory.name)
    end
end

