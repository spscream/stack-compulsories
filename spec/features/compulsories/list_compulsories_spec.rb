require 'acceptance_helper'

feature 'List compulsories', %q{
  In order to learn figures
  As an user
  I want to view list of figures
} do

    given!(:compulsories) { create_list(:compulsory, 10)}

    scenario 'view list' do
        visit compulsories_path

        expect(page).to have_content compulsories.first.name
    end
end

