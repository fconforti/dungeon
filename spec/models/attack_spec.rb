RSpec.describe Attack do

  describe "resolve" do
    attack = new_attack(attacker_type: "warrior", receiver_type: "thief")
    receiver_hp = attack.receiver.hp
    attack.resolve

    it "decrements the receiver hp by the damage" do
      expect(attack.receiver.hp).to eq(receiver_hp - attack.damage)
    end

  end

end