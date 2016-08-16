require_relative 'node'

describe Node do

  let(:alyssa) { Node.new("Alyssa") }
  let(:casey) { Node.new("Casey") }
  let(:duke) { Node.new("Duke") }
  let(:jones) { Node.new("Jones") }
  let(:matt) { Node.new("Matt") }
  let(:maurice) { Node.new("Maurice") }
  let(:mike) { Node.new("Mike") }

  before(:each) do
    matt.edges = [mike, maurice]
    mike.edges = [casey, duke, maurice]
    duke.edges = [alyssa]
    jones.edges = [casey]
  end

  it "can return its value" do
    expect(duke.value).to eq("Duke")
  end

  it "can add other nodes as edges" do
    matt.add_edge(casey)
    expect(matt.edges).to include(mike)
    expect(matt.edges).to include(casey)
    expect(matt.edges).not_to include(alyssa)
  end

  it "can output the values of its edges" do
    expect(mike.nodes).to eq( [ casey, duke, maurice ] )
    expect  { mike.nodes }.to output("\"Casey\"\n\"Duke\"\n\"Maurice\"\n").to_stdout
  end

  it "can check if a node follows another" do
    expect(matt.exists? {|node| node.value == "Alyssa"} ).to be true
    expect(alyssa.exists? {|node| node.value == "Alyssa"} ).to be true
    expect(duke.exists? {|node| node.value == "Maurice"} ).to be false
  end



end
