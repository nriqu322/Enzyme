require './lib/hash_compare.rb'

RSpec.describe Comparison do
  hash1 = { "name" => "Luis", "last_name" => "Saavedra", "age" => 67, "married" => true, "nationality" => "Peruvian", "hobbies" => ['travel', 'videogames', 'cooking'], "pet_info" => { "type" => "dog", "name" => { "firstname" => "danke", "lastname" => "saavedra"}, "age" => 6 }}
  hash2 = { "name" => "Luis", "last_name" => "Saavedra", "age" => 67, "married" => true, "nationality" => "Peruvian", "hobbies" => ['travel', 'videogames', 'cooking'], "pet_info" => { "type" => "dog", "name" => { "firstname" => "danke", "lastname" => "saavedra"}, "age" => 6 }}
  hash3 = hash1

  hash4 = { "name" => "Luis", "last_name" => "Saavedra", "age" => 67, "married" => true, "nationality" => "Peruvian", "hobbies" => ['travel', 'videogames', 'cooking'], "pet_info" => { "type" => "dog", "name" => { "firstname" => "dankei", "lastname" => "saavedra"}, "age" => 6 }}
  hash5 = { "last_name" => "Saavedra", "age" => 67, "married" => true, "nationality" => "Peruvian", "hobbies" => ['travel', 'videogames', 'cooking'], "pet_info" => { "type" => "dog", "name" => { "firstname" => "danke", "lastname" => "saavedra"}, "age" => 6 }}
  hash6 = { "name" => "Luis", "last_name" => "Saavedra", "age" => 67, "married" => true, "nationality" => "Peruvian", "hobbies" => ['travel', 'videogames', 'cooking'], "pet_info" => { "type" => "dog", "name" => { "firstname" => "danke", "lastname" => "saavedra"}, "age" => 6 }, "studies" => "Lima University"}
  hash7 = {"last_name" => "Saavedra", "age" => 66, "married" => true, "nationality" => "Peruvian", "hobbies" => ['travel', 'videogames', 'cooking'], "pet_info" => { "type" => "dog", "name" => { "firstname" => "danke", "lastname" => "saavedra"}, "age" => 6 }, "studies" => "Lima University"}

  let(:comparison) { Comparison.new }

  context 'Deep Comparison' do
    it 'reference to different space in memory' do
      expect(comparison.compare(hash1, hash2, true)).to eql("Deep Comparison: Hashes are different") 
    end

    it 'reference to same space in memory' do
      expect(comparison.compare(hash1, hash3, true)).to eql("Deep comparison: Hashes are the same") 
    end
  end

  context 'Shallow Comparison' do
    it 'hashes content are the same' do
      expect(comparison.compare(hash1, hash2, false)).to eql("Shallow comparison: Hashes are the same")
    end

    it 'hashes differ after removing one key-value pair' do
      expect(comparison.compare(hash1, hash5, false)).to eql({"name"=>["Luis", nil]})
    end

    it 'differ after adding a new key-value pair' do
      expect(comparison.compare(hash1, hash6, false)).to eql({"studies" => [nil, "Lima University"]})
    end

    it 'hashes differ inside nested hash' do
      expect(comparison.compare(hash1, hash4, false)).to eql({"pet_info"=>{"name"=>{"firstname"=>["danke", "dankei"]}}})
    end

    it ' evaluate many differences' do
      expect(comparison.compare(hash1, hash7, false)).to eql({"name"=>["Luis", nil], "age"=>[67, 66], "studies"=>[nil, "Lima University"]})
    end
  end
end
