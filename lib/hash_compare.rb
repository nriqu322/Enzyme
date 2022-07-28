hash1 = { "name" => "Luis", "last_name" => "Saavedra", "age" => 35, "married" => true, "nationality" => "Peruvian", "hobbies" => ['travel', 'videogames', 'cooking'], "pet_info" => { "type" => "dog", "name" => "danke", "age" => "6" }}
hash2 = { name: "Luis", "last_name" => "Saavedra", "age" => 35, "married" => true, "nationality" => "Peruvian", "hobbies" => ['travel', 'videogames', 'cooking'], "pet_info" => { "type" => "dog", "name" => "danke", "age" => "6" }}

p hash1
p hash1 === hash2
diff_in_hash1 = hash1.reject{|key, value| hash2[key] == value}
diff_in_hash2 = hash2.reject{|key, value| hash1[key] == value}
p diff_in_hash1
p diff_in_hash2

hash2["hair"] = "black"

p hash1 === hash2
diff_in_hash1 = hash1.reject{|key, value| hash2[key] == value}
diff_in_hash2 = hash2.reject{|key, value| hash1[key] == value}
p diff_in_hash1
p diff_in_hash2