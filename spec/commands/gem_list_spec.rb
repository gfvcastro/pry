require_relative '../helper'

describe "gem-list" do
  it 'should not raise when invoked' do
    expect { pry_eval(self, 'gem-list') }.to_not raise_error
  end

  it 'should work arglessly' do
    list = pry_eval('gem-list')
    list.should =~ /slop \(/
    list.should =~ /rspec \(/
  end

  it 'should find arg' do
    prylist = pry_eval('gem-list slop')
    prylist.should =~ /slop \(/
    prylist.should_not =~ /rspec/
  end

  it 'should return non-results as silence' do
    pry_eval('gem-list aoeuoueouaou').should be_empty
  end
end
