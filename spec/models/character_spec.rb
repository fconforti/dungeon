RSpec.describe Character do

  context "when warrior" do
    character = Character.new

    it "has hp: 50" do
      expect(character.hp).to eq(50)
    end

    it "has strength: 12" do
      expect(character.strength).to eq(12)
    end

    it "has speed: 11" do
      expect(character.speed).to eq(11)
    end

    it "has xp: 0" do
      expect(character.xp).to eq(0)
    end

    it "has gold: 0" do
      expect(character.gold).to eq(0)
    end

  end

  context "when mage" do
    character = Character.new(type: "mage")

    it "has hp: 30" do
      expect(character.hp).to eq(30)
    end

    it "has strength: 10" do
      expect(character.strength).to eq(10)
    end

    it "has speed: 10" do
      expect(character.speed).to eq(10)
    end

    it "has xp: 0" do
      expect(character.xp).to eq(0)
    end

    it "has gold: 0" do
      expect(character.gold).to eq(0)
    end

  end

  context "when thief" do
    character = Character.new(type: "thief")

    it "has hp: 35" do
      expect(character.hp).to eq(35)
    end

    it "has strength: 7" do
      expect(character.strength).to eq(7)
    end

    it "has speed: 19" do
      expect(character.speed).to eq(19)
    end

    it "has xp: 0" do
      expect(character.xp).to eq(0)
    end

    it "has gold: 0" do
      expect(character.gold).to eq(0)
    end


  end

end