json.array!(@weapons) do |weapon|
  json.extract! weapon, :id, :zombie_id, :name, :damage
  json.url weapon_url(weapon, format: :json)
end
