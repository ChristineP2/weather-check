# frozen_string_literal: true

# it_behaves_like 'a WeatherAPI Call that ', 'present'
RSpec.shared_examples_for('a WeatherAPI Call regarding the') do |prefix|
  it 'has a q' do
    expect(subject.send("#{prefix}_params")).to have_key(:q)
  end

  it 'q is the zip_code' do
    expect(subject.send("#{prefix}_params")[:q]).to eq(zip_code)
  end

  it 'has a key' do
    expect(subject.send("#{prefix}_params")).to have_key(:key)
  end
end

# it_behaves_like 'a dated WeatherAPI Call'
RSpec.shared_examples_for('a dated WeatherAPI Call') do |prefix|
  it 'has dt in the params' do
    expect(subject.send("#{prefix}_params")).to have_key(:dt)
  end
end
