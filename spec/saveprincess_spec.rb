require './saveprincess'

RSpec.describe "Bot Saves Princess Solution" do

  def grid(n=3)
    Array.new(n, n * "-")
  end

  def topleft(grid)
    grid[0][0] = "p"
    grid
  end

  def topright(grid)
    grid[0][-1] = "p"
    grid
  end

  def botleft(grid)
    grid[-1][0] = "p"
    grid
  end

  def botright(grid)
    grid[-1][-1] = "p"
    grid
  end

  it "points mario in the right direction" do
    expect (get_directions(topleft(grid()))).to eq("UP\LEFT\n")
    expect (get_directions(topright(grid()))).to eq("UP\nRIGHT\n")
    expect (get_directions(botleft(grid()))).to eq("DOWN\LEFT\n")
    expect (get_directions(botright(grid()))).to eq("DOWN\nRIGHT\n")
  end

  it "prints the correct number of steps" do
    expect (displayPathtoPrincess(3,topleft(grid()))).to output("UP\nLEFT\n").to_stdout
    expect (displayPathtoPrincess(3,topright(grid()))).to output("UP\nRIGHT\n").to_stdout
    expect (displayPathtoPrincess(3,botleft(grid()))).to output("DOWN\nLEFT\n").to_stdout
    expect (displayPathtoPrincess(3,botright(grid()))).to output("DOWN\nRIGHT\n").to_stdout

    expect (displayPathtoPrincess(5,topleft(grid(5)))).to output("UP\nLEFT\nUP\nLEFT\n").to_stdout
    expect (displayPathtoPrincess(5,topright(grid(5)))).to output("UP\nRIGHT\nUP\nRIGHT\n").to_stdout
    expect (displayPathtoPrincess(5,botleft(grid(5)))).to output("DOWN\nLEFT\nDOWN\nLEFT\n").to_stdout
    expect (displayPathtoPrincess(5,botright(grid(5)))).to output("DOWN\nRIGHT\nDOWN\nRIGHT").to_stdout

    expect (displayPathtoPrincess(7,topleft(grid(7)))).to output("UP\nLEFT\nUP\nLEFT\nUP\nLEFT\n").to_stdout
    expect (displayPathtoPrincess(7,topright(grid(7)))).to output("UP\nRIGHT\nUP\nRIGHT\nUP\nRIGHT\n").to_stdout
    expect (displayPathtoPrincess(7,botleft(grid(7)))).to output("DOWN\nLEFT\nDOWN\nLEFT\nDOWN\nLEFT\n").to_stdout
    expect (displayPathtoPrincess(7,botright(grid(7)))).to output("DOWN\nRIGHT\nDOWN\nRIGHT\nDOWN\nRIGHT\n").to_stdout
  end
end