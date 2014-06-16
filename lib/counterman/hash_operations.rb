class Minuteman
  module HashOperations
    extend Forwardable

    def_delegators :Counterman, :safe, :redis

    def count
      safe { redis.hget(key) }
    end
  end
end