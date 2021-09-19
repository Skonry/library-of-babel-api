class ValidationErrorsSerializer
  attr_reader :record

  def initialize(record)
    @record = record
  end

  def serialize
    errors = []
    record.errors.each do |attribute, error|
      errors << {
        source: { pointer: '/data/attributes/' + attribute.to_s.camelize(:lower)},
        title: 'Invalid attribute',
        detail: record.errors.full_message(attribute, error)
      }
    end
    return errors
  end
end