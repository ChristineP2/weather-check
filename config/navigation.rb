# frozen_string_literal: true

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :home, 'Home', home_path
  end
end
