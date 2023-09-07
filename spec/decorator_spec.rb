require_relative '../school_library/decorators/capitalize_decorator'
require_relative '../school_library/decorators/trimmer_decorator'
require_relative '../school_library/library/person'

describe CapitalizeDecorator do
  describe '#should capitalize the name' do
    it 'should capitalize the name' do
      person = Person.new(1, name: 'maximilianus', age: 25)
      capitalized = CapitalizeDecorator.new(person)
      expect(capitalized.correct_name).to eql 'Maximilianus'
    end
  end
end

describe TrimmerDecorator do
  describe '#should trim the name' do
    it 'should trim the name' do
      person = Person.new(1, name: 'maximilianus', age: 25)
      trimmed = TrimmerDecorator.new(person).correct_name
      expect(trimmed).to eql 'maximilian'
    end
  end
end
