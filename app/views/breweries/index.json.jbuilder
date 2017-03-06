json.array!(@breweries) do |brewery|
  json.extract! brewery, :name, :year


end
