# Returns the id, clock_in, clock_out
class SleepSerializer < ActiveModel::Serializer
  attributes :id, :clock_in, :clock_out
end
