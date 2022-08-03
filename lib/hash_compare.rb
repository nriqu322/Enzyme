class Comparison
  def compare(hash1, hash2, deep)
    if deep
      if hash1.object_id === hash2.object_id
        return 'Deep comparison: Hashes are the same'
      else
        return 'Deep Comparison: Hashes are different'
      end
    else
      if hash1 === hash2
        return 'Shallow comparison: Hashes are the same'
      else
        (hash1.keys | hash2.keys).each_with_object({}) do |item, hash|
          if hash1[item] != hash2[item]
            if hash1[item].is_a?(Hash) && hash2[item].is_a?(Hash)
              hash[item] = compare(hash1[item], hash2[item], false)
            elsif hash1[item].is_a?(Array) && hash2[item].is_a?(Array)
              hash[item] = [hash1[item] - hash2[item], hash2[item] - hash1[item]]
            else
              hash[item] = [hash1[item], hash2[item]]
            end
          end
          hash
        end
      end
    end
  end
end
