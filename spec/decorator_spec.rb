require_relative '../school_library/decorators/capitalize_decorator'
require_relative '../school_library/decorators/trimmer_decorator'
require_relative '../school_library/library/person'

describe CapitalizeDecorator do
  describe '#should capitalize the name' do
    it 'should capitalize the name' do
      capitalized = CapitalizeDecorator.new(Person.new(1, name: 'maximilianus', age: 25))
      capitalized.correct_name.should eql 'Maximilianus'
    end
  end
end

describe TrimmerDecorator do
  describe '#should trim the name' do
    it 'should trim the name' do
      trimmed = TrimmerDecorator.new(Person.new(1, name: 'maximilianus ', age: 25))
      trimmed.correct_name.should eql 'maximilian'
    end
  end
end