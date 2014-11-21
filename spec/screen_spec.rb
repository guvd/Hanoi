require './spec/spec_helper'
require './lib/screen'

describe Screen do


  it "given an array should return the tower" do
    screen = Screen.new
    rod = [3,2,1]

    rod_output = [ 
                   [" ", " ", "_", "|" , "_", " ", " "],
                   [" ", "_", "_", "|" , "_", "_", " "],
                   ["_", "_", "_", "|" , "_", "_", "_"]
                 ]
    screen.render_rod(rod).must_equal(rod_output)
  end


end


