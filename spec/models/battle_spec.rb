RSpec.describe Battle do

  describe "#resolve" do
    battle = new_battle(resolve: true)

    it "determines a single winner" do
      expect battle.attacker.dead? ^ battle.receiver.dead?
    end

    it "transfers the looser's gold to the winner" do
      expect(battle.winner.gold).to eq(20)
      expect(battle.looser.gold).to eq(0)
    end

    it "adds 10 experience points to the winner" do
      expect(battle.winner.xp).to eq(10)
    end

  end

  describe "#resolved?" do
  
    context "when not resolved" do
      battle = new_battle

      it "returns false" do
        expect(battle.resolved?).to be false
      end

    end

    context "when resolved" do
      battle = new_battle(resolve: true)

      it "returns true" do
        expect(battle.resolved?).to be true
      end

    end

  end

  describe "#winner" do
    context "when not resolved" do
      battle = new_battle

      it "returns nil" do
        expect(battle.winner).to be nil
      end

    end

    context "when resolved" do
      battle = new_battle(resolve: true)

      it "returns the winner character" do
        winner = battle.receiver.dead? ? battle.attacker : battle.receiver
        expect(battle.winner).to eq(winner)
      end

    end

  end

  describe "#looser" do
    context "when not resolved" do
      battle = new_battle

      it "returns nil" do
        expect(battle.looser).to be nil
      end

    end

    context "when resolved" do
      battle = new_battle(resolve: true)

      it "returns the looser character" do
        looser = battle.receiver.dead? ? battle.receiver : battle.attacker
        expect(battle.looser).to eq(looser)
      end

    end

  end

end