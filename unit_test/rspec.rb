require_relative 'tennis'
describe 'Tennis Score' do
  before(:each) do
    @ts = TennisScorer.new
  end
  it 'should start with a score of 0-0' do
    @ts.score.should == "0-0"
  end
  it 'should be 15-0 if the server wins a point' do
    @ts.give_point_to(:server)
    @ts.score.should == "15-0"
  end
  it 'should be 0-15 if the receiver wins a point' do
    @ts.give_point_to(:receiver)
    @ts.score.should == "0-15"
  end
end