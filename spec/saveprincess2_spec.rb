require './saveprincess2'

RSpec.describe "Bot Saves Princess 2 Solution" do

  before do 
    @mario = @peach = [nil, nil]
  end

  def grid(n=3)
    Array.new(n) { "-" * n }
  end

  def pick_spot(grid)
    row, col = rand(0...grid.size), rand(0...grid.size)
  end

  def place_chars(grid)
    @peach = @mario = pick_spot(grid)
    grid[@peach[0]][@peach[1]] = "p"
    until @mario != @peach
      @mario = pick_spot(grid)
    end
    grid
  end

  def capture_stdout
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = original_stdout
  end

  def travel_to_peach(grid)
    while @mario != @peach
      move = capture_stdout { nextMove(grid.size, @mario[0], @mario[1], grid) }
      case move
      when "UP"
        @mario[0] -= 1
      when "DOWN"
        @mario[0] += 1
      when "LEFT"
        @mario[1] -= 1
      when "RIGHT"
        @mario[1] += 1
      end
    end
  end

  it "takes mario to peach no matter where they start or how far he must go" do
    grid5 = place_chars(grid(5))
    expect(@mario).not_to eq(@peach)
    travel_to_peach(grid5)
    expect(@mario).to eq(@peach)

    grid10 = place_chars(grid(10))
    expect(@mario).not_to eq(@peach)
    travel_to_peach(grid10)
    expect(@mario).to eq(@peach)

    grid25 = place_chars(grid(25))
    expect(@mario).not_to eq(@peach)
    travel_to_peach(grid25)
    expect(@mario).to eq(@peach)

    grid50 = place_chars(grid(50))
    expect(@mario).not_to eq(@peach)
    travel_to_peach(grid50)
    expect(@mario).to eq(@peach)

    grid100 = place_chars(grid(100))
    expect(@mario).not_to eq(@peach)
    travel_to_peach(grid100)
    expect(@mario).to eq(@peach)
  end
end