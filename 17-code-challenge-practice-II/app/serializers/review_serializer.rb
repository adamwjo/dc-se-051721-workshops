class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rating, :song_id, :super_fan_id
end
