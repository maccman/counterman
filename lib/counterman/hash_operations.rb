class Counterman
  module HashOperations
    extend Forwardable

    def_delegators :Counterman, :safe, :redis

    def count(id)
      safe { redis.hget(key, id).to_i }
    end

    def count_all(ids)
      redis.pipelined do
        ids.each do |id|
          redis.hget(key, id)
        end
      end.map(&:to_i)
    end

    def all_counts
      counts = redis.hgetall(key)
      counts.inject({}) do |hash, (k,v)|
        hash[k.to_i] = v.to_i
        hash
      end
    end
  end
end