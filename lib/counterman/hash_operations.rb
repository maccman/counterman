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
  end
end