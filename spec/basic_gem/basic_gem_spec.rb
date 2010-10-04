require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Oct do
  
  describe 'version' do

    it "should return a string formatted '#.#.#'" do
      Oct::version.should match(/(^[\d]+\.[\d]+\.[\d]+$)/)
    end

  end

end
