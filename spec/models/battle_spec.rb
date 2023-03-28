RSpec.describe Battle do

  describe "#resolve" do   
  
    let(:prompt) { TTY::Prompt::Test.new }
    let(:battle) { new_battle(gold: 20) }

    before do
      allow(prompt).to receive(:select).and_return "A"
      allow(battle).to receive(:prompt).and_return prompt
      battle.resolve
    end

    it "determines a single winner" do
      expect battle.attacker.dead? ^ battle.receiver.dead?
    end

    it "transfers 20 gold stones from the looser to the winner" do
      expect(battle.winner.gold).to eq(40)
      expect(battle.looser.gold).to eq(0)
    end

    it "adds 10 experience points to the winner" do
      expect(battle.winner.xp).to eq(10)
    end

  end

  describe "#resolved?" do

    let(:prompt) { TTY::Prompt::Test.new }
    let(:battle) { new_battle }

    before do
      allow(prompt).to receive(:select).and_return "A"
      allow(battle).to receive(:prompt).and_return prompt
    end
  
    context "when not resolved" do
      it "returns false" do
        expect(battle.resolved?).to be false
      end

    end

    context "when resolved" do
      before do
        battle.resolve
      end

      it "returns true" do
        expect(battle.resolved?).to be true
      end

    end

  end

  describe "#winner" do
    let(:prompt) { TTY::Prompt::Test.new }
    let(:battle) { new_battle }

    before do
      allow(prompt).to receive(:select).and_return "A"
      allow(battle).to receive(:prompt).and_return prompt
    end

    context "when not resolved" do

      it "returns nil" do
        expect(battle.winner).to be nil
      end

    end

    context "when resolved" do
      before do
        battle.resolve
      end

      it "returns the winner character" do
        winner = battle.receiver.dead? ? battle.attacker : battle.receiver
        expect(battle.winner).to eq(winner)
      end

    end

  end

  describe "#looser" do
    let(:prompt) { TTY::Prompt::Test.new }
    let(:battle) { new_battle }

    before do
      allow(prompt).to receive(:select).and_return "A"
      allow(battle).to receive(:prompt).and_return prompt
    end

    context "when not resolved" do

      it "returns nil" do
        expect(battle.looser).to be nil
      end

    end

    context "when resolved" do
      before do
        battle.resolve
      end

      it "returns the looser character" do
        looser = battle.receiver.dead? ? battle.receiver : battle.attacker
        expect(battle.looser).to eq(looser)
      end

    end

  end

end