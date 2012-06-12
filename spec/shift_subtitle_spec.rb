require 'minitest/autorun'
require 'shift_subtitle'

describe ShiftSubtitle do
  it 'must exist' do
    ShiftSubtitle.new.must_be_kind_of ShiftSubtitle
  end
end
