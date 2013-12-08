require 'digest/sha1'
require "sha_cache/version"
require "sha_cache/config"
require "sha_cache/client"
require "sha_cache/adapters/null_adapter"
require "sha_cache/adapters/redis_adapter"
require "redis"

module ShaCache
end
