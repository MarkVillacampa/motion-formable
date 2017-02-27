class HashHelper
  # Used to merge two or more hashes, and merge duplicate keys in an array.
  #
  # Example:
  #
  #   hashes = [
  #     { animal: 'dog', food: 'pizza' },
  #     { animal: 'cat' }
  #   ]
  #   HashHelper.merge_hashes(hashes)
  #   # => { animal: ['dog', 'cat'], food: 'pizza' }
  #
  def self.merge_hashes(hashes)
    hash = {}
    hashes.each do |h|
      h.each do |k, v|
        current_value = hash[k]
        if current_value == nil
          hash[k] = v
        elsif current_value.is_a? Array
          hash[k] << v
        elsif current_value.is_a?(Hash) && v.is_a?(Hash)
          hash[k].merge!(v)
        else
          hash[k] = [hash[k], v]
        end
      end
    end
    hash
  end
end
