# A robot factory's test facility needs a program to verify robot movements.

# The robots have three possible movements:

#     turn right
#     turn left
#     advance

# Robots are placed on a hypothetical infinite grid, facing a particular 
# direction (north, east, south, or west) at a set of {x,y} coordinates, 
# e.g., {3,8}, with coordinates increasing to the north and east.

# The robot then receives a number of instructions, at which point the 
# testing facility verifies the robot's new position, and in which direction 
# it is pointing.

#     The letter-string "RAALAL" means:
#         Turn right
#         Advance twice
#         Turn left
#         Advance once
#         Turn left yet again

# Say a robot starts at {7, 3} facing north. Then running this 
# stream of instructions should leave it at {9, 4} facing west.

class Robot

  DIRECTIONS = [:west, :north, :east, :south].freeze
  
  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    @direction = direction
  end

  def bearing
    @direction
  end

  def turn_right
    new_dir_index = DIRECTIONS.index(@direction) + 1
    if new_dir_index == 4
      orient(DIRECTIONS[0])
    else
      orient(DIRECTIONS[new_dir_index])
    end
  end

  def turn_left
    new_dir_index = DIRECTIONS.index(@direction) - 1
    if new_dir_index == -1
      orient(DIRECTIONS[3])
    else
      orient(DIRECTIONS[new_dir_index])
    end
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def coordinates
    @coordinates
  end

  def advance
    case bearing
    when :west then @coordinates[0] -= 1
    when :north then @coordinates[1] += 1
    when :east then @coordinates[0] += 1
    when :south then @coordinates[1] -= 1
    end
  end
end

class Simulator

  def instructions(string)
    string.chars.map do |instruction|
      case instruction
      when 'L' then :turn_left
      when 'R' then :turn_right
      when 'A' then :advance
      end
    end
  end

  def place(robot, options) 
    robot.at(options[:x], options[:y])
    robot.orient(options[:direction])
  end

  def evaluate(robot, string)
    instructions(string).each do |instruction|
      case instruction
      when :turn_left then robot.turn_left
      when :turn_right then robot.turn_right
      when :advance then robot.advance
      end
    end
  end
end
