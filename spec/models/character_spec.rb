RSpec.describe Character do
  character = Character.new

  it "has hp: 100" do
    expect(character.hp).to eq(100)
  end

  it "has xp: 0" do
    expect(character.xp).to eq(0)
  end

  it "has gold: 10" do
    expect(character.gold).to eq(10)
  end

end