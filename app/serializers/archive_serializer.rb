class ArchiveSerializer
  include JSONAPI::Serializer
  attributes :item_type, :item_id, :event, :whodunnit, :object
end
