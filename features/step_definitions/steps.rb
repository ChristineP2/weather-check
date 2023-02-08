# frozen_string_literal: true

Given(/^a user is on the home page$/) do
  visit root_path
end

When(/^the user enters an address and clicks submit$/) do
  fill_in 'location[address]', with: '123 Main St'
  fill_in 'location[zip_code]', with: '90210'
  click_button 'Submit'
end

When(/^the user enters a bad zip code and clicks submit$/) do
  fill_in 'location[address]', with: '123 Main St'
  fill_in 'location[zip_code]', with: '55212'
  click_button 'Submit'
end

Then(/^they should receive the US zip code error/) do
  expect(page).to have_text(
    'Please provide a ZIP code within the United States.'
  )
end

Then(/^they should see the location entered/) do
  expect(page).to have_text('123 Main St')
  expect(page).to have_text('90210')
end

Then(/^they should see the weather tabs$/) do
  expect(page).to have_selector('#past-tab', count: 1)
  expect(page).to have_selector('#present-tab', count: 1)
  expect(page).to have_selector('#future-tab', count: 1)
end
