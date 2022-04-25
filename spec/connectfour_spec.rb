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



end
