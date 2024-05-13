# Bot Saves Princess Code Challenge

### Tools Used
* [Ruby](https://www.ruby-lang.org/en/)
* [Docker](https://www.docker.com/products/docker-desktop/)
* [RSpec](https://rspec.info/)

## Introduction

This repo contains solutions for the Hacker Rank [Bot Saves Princess](https://www.hackerrank.com/challenges/saveprincess2) [challenges](https://www.hackerrank.com/challenges/saveprincess2), as well as a simple test suite for checking results locally. I had a blast designing and optimizing these solutions to be both efficient and readable. I encountered the most difficulty not in the solutions themselves, but in my local Ruby environment, which despite my persistent reinstallation and configuration efforts, was not cooperating in a timely manner. I had to try a different approach, so I opted to try Docker as a solution to my configuration woes. Although I hadn't made my own Dockerfile before, I was able to get one spun up pretty quickly and easily, and greatly appreciate the simple and powerful functionality it afforded me. If I had had more time to dedicate to this project, I would have liked to create a terminal game to help visualize the code's execution, but we will have to settle for verification of the code's functionality via Hacker Rank and the test suite.


## The Solutions
### How to run in Hacker Rank:

  <br/>
  - Scroll down to the code editor in the "Problem" tab, and select "Ruby" from the language dropdown
  <br/>
  - Delete the code in the editor, and copy and paste the following code block in its place</li>

## **[Bot Saves Princess - Display Path to Princess](https://www.hackerrank.com/challenges/saveprincess)**
```ruby
#!/bin/ruby

def displayPathtoPrincess(n,grid)
    print get_directions(grid) * (n/2)
end

def get_directions(grid)
  case "p"
  when grid[0][0]
    "UP\nLEFT\n"
  when grid[0][-1]
    "UP\nRIGHT\n"
  when grid[-1][0]
    "DOWN\nLEFT\n"
  when grid[-1][-1]
    "DOWN\nRIGHT\n"
  end
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
  grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
```

### Solution Breakdown:

I believe this solution achieves the minimal possible amount of computation needed to solve the problem. The first challenge has the constraints that Mario is always in the center, and Peach is in one of the four corners. Therefore, we only need to check the corners until we have found Peach, and use Mario's center position relative to that corner to generate the move directions (both horizontal and vertical). The number of times the move pair needs to be executed is derived from the size of the grid, n, by dividing by 2 (and rounding down) with (n/2). We print the relevant directions that many times, and save the princess.


## **[Bot Saves Princess 2 - Next Move](https://www.hackerrank.com/challenges/saveprincess2)**
```ruby
#!/bin/ruby

def nextMove(n,r,c,grid)
  print get_direction(mario_row: r, mario_col: c, **peach_position(grid))
end

def peach_position(grid)
  grid.each_with_index do |chars, row|
      col = chars.index("p")
      return {:peach_row => row, :peach_col => col} if col
  end
end

def get_direction(peach_row:, peach_col:, mario_row:, mario_col:)
  peach_col == mario_col ? row_move(peach_row, mario_row) : col_move(peach_col, mario_col)
end

def col_move(peach_col, mario_col)
  mario_col - peach_col > 0 ? "LEFT" : "RIGHT"
end

def row_move(peach_row, mario_row)
  mario_row - peach_row > 0 ? "UP" : "DOWN"
end


n = gets.to_i
r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
```

### Solution Breakdown:

Since Peach is placed randomly rather than in the corners, we must search the whole grid to find her. I iterate through each row of the grid until finding "p" and return its coordinates in a hash:

```ruby
def peach_position(grid)
  grid.each_with_index do |chars, row|
      col = chars.index("p")
      return {:peach_row => row, :peach_col => col} if col
  end
end
```
Peach's coordinates get packaged as keyword arguments together with Mario's in the main function's call to get_directions:

```ruby
def nextMove(n,r,c,grid)
  print get_direction(mario_row: r, mario_col: c, **peach_position(grid))
end
```
Since we know the game will stop once Mario reaches Peach, we only need to check if either the row or column already match before deciding which way to go. If the column doesn't match yet, we move the column, else, we move the row, by checking whether the difference in coordinates is positive or negative and assigning the relevant direction accordingly:

```ruby
def get_direction(peach_row:, peach_col:, mario_row:, mario_col:)
  peach_col == mario_col ? row_move(peach_row, mario_row) : col_move(peach_col, mario_col)
end

def col_move(peach_col, mario_col)
  mario_col - peach_col > 0 ? "LEFT" : "RIGHT"
end

def row_move(peach_row, mario_row)
  mario_row - peach_row > 0 ? "UP" : "DOWN"
end
```

Finally, the direction gets printed back in the main function that started this chain.

```ruby
def nextMove(n,r,c,grid)
  print get_direction(mario_row: r, mario_col: c, **peach_position(grid))
end
```

#### Using The Dockerfile

First, clone this repo and cd into the root directory:

`git clone git@github.com:abwmn/bot_saves_princess.git`

`cd bot_saves_princess`

Next, run the following command to create the Docker image:

`docker build -t andrew-code-challenge .`

Now you can run the test suite through the Docker container using:

`docker run andrew-code-challenge`

Or, you can bash into the container itself and run tests individually using:

`docker run -it --rm -v $(pwd):/app andrew-code-challenge /bin/bash`

Now that you're in the Docker container, you can run the specs using:

`bundle exec rspec spec/`
