RSpec.describe Attack do

  describe "#strength" do
    attack = new_attack(attacker_type: "warrior", receiver_type: "thief", resolve: true)

    it "returns the attacker/receiver strength delta" do
      expect(attack.strength).to eq(5)
    end
  end

  describe "damage" do
    attack = new_attack(attacker_type: "warrior", receiver_type: "thief", resolve: true)

    it "returns an integer" do
      expect(attack.damage.class).to eq(Integer)
    end

  end

  describe "resolve" do
    attack = new_attack(attacker_type: "warrior", receiver_type: "thief")
    receiver_hp = attack.receiver.hp
    attack.resolve

    it "decrements the receiver hp by the damage" do
      expect(attack.receiver.hp).to eq(receiver_hp - attack.damage)
    end

  end

end