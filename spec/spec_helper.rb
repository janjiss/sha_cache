require "sha_cache"

def convert_to_sha(body)
  Digest::SHA1.hexdigest(body)
end 

