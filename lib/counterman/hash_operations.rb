class Counterman
  module HashOperations
    extend Forwardable

    def_delegators :Counterman, :safe, :redis

    def count(id)
      safe { redis.hget(key, id).to_i }
    end
  end
end