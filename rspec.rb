require './kata'

describe 'tennis game' do
  before :each do
    @p1, @p2 = Player.new('John Palino'), Player.new('Barack Obama')
    @game = Game.new(@p1, @p2)
  end

  let(:both_score_40) {
    3.times { @p1.score @game }
    3.times { @p2.score @game }
  }

  it 'when the game starts the score is 0:0' do
    @game.score.should == '0:0'
  end

  it 'the first player scores' do
    @p1.score @game
    @game.score.should == '15:0'
  end
  
  it 'the second player scores' do
    @p2.score @game
    @game.score.should == '0:15'
  end

  it 'the first player scores twice' do
    @p1.score @game
    @p1.score @game
    @game.score.should == '30:0'
  end
  
  it 'the first player scores three times' do
    3.times { @p1.score @game }
    @game.score.should == '40:0'
  end

  it 'the first player scores four times and wins' do
    4.times { @p1.score @game }
    @game.score.should == 'John Palino wins!'
  end
  
  it 'the second player scores four times and wins - WELL DONE BARACK!' do
    4.times { @p2.score @game }
    @game.score.should == 'Barack Obama wins!'
  end

  context 'both scored 40' do
    before :each do
      both_score_40
    end

    it "it's deuce" do
      @game.score.should == 'deuce' 
    end
  
    it "the first player scored once after reaching 40, it's his advantage"  do
      @p1.score @game
      @game.score.should == "John Palino's advantage" 
    end

    it "scored 1 each after 40, it's deuce" do
      @p1.score @game
      @p2.score @game
      @game.score.should == 'deuce'
    end

    it 'scored 1 each after 40, then Barack scores 2 more, win' do
      2.times { @p2.score @game }
      @game.score.should == 'Barack Obama wins!'
    end
  end
end
