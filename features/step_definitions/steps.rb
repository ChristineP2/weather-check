# frozen_string_literal: true

Given(/^a user is on the home page$/) do
  visit root_path
end

When(/^the user enters an address and clicks submit$/) do
  fill_in 'location[address]', with: '123 Main St'
  fill_in 'location[zip_code]', with: '90210'
  click_button 'Submit'
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

# Then(/^they should see the weather information for Today/) do
#   expect(page).to have_selector('#present-tab.is-active', count: 1)
#
#   expect(page).to have_selector('#present-content.is-active', count: 1)
#   expect(page).to have_selector('#present-content .weather.card', count: 1)
# end
#
# Then(/^they click on the past tab$/) do
#   find(:css, "#past-tab").trigger("click")
# end
#
# Then(/^they click on the future tab$/) do
#   find(:css, "#future-tab").trigger("click")
# end
#
# Then(/^they should see past weather information$/) do
#   within(:css, '#past-content.is-active') do
#     count = all('.columns .column .weather.card').count
#     expect(count).to eq(1)
#   end
# end
#
# Then(/^they should see the Forecast$/) do
#   expect(page).to have_selector(
#     '#future-content.is-active .weather.card',
#     count: 10
#   )
# end
