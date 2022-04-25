require "./connect-four"

describe ConnectFour do
  subject(:default_game) { ConnectFour.new }
  m = Matrix[ ["-", "-", "-", "-", "-", "-","-"],
              ["-", "-", "-", "-", "-", "-","-"],
              ["-", "-", "-", "-", "-", "-","-"],
              ["-", "-", "-", "-", "-", "-","-"],
              ["-", "-", "-", "-", "-", "-","-"],
              ["-", "-", "-", "-", "-", "-","-"]  ]

  context "testing board" do
    it "board is correct" do
      expect(default_game.board).to eql(m)
    end

    it "first movement" do
      expect(default_game.player1_move).not_to eql(m)
    end
  end

  context "valid input?" do
    it "accepts 2" do
      expect(default_game.valid_move?(2)).to eq(true)
    end

    it "refuses 7" do
      expect(default_game.valid_move?(7)).not_to eq(true)
    end
  end

end
