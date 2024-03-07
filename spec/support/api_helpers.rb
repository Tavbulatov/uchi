# frozen_string_literal: true

module ApiHelpers
  def json
    @json ||= JSON.parse(response.body)
  end

  def extract_attributes(serializer, resource)
    serializer.new(resource).serializable_hash[:data].map { _1[:attributes] }.as_json
  end
end
