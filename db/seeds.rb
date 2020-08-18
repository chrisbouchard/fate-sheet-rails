# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Alice

alice = Character.find_or_create_by(name: 'Alice') do |character|
  character.fate_points = 0
  character.refresh = 3
end

Aspect.find_or_create_by(character: alice, position: 1) do |aspect|
  aspect.label = 'High Concept'
  aspect.name = 'Rails Application Testing Data'
end

Aspect.find_or_create_by(character: alice, position: 2) do |aspect|
  aspect.label = 'Trouble'
  aspect.name = 'I\'m Actually a Computer'
end

Aspect.find_or_create_by(character: alice, position: 3) do |aspect|
  aspect.name = 'Created from a Seed'
end

Aspect.find_or_create_by(character: alice, position: 4) do |aspect|
  aspect.name = 'Dynamically Typed'
end


# Bob

bob = Character.find_or_create_by(name: 'Bob') do |character|
  character.fate_points = 1
  character.refresh = 2
end

Aspect.find_or_create_by(character: bob, position: 1) do |aspect|
  aspect.label = 'High Concept'
  aspect.name = 'Artificially Generated Adversary'
end

Aspect.find_or_create_by(character: bob, position: 2) do |aspect|
  aspect.label = 'Trouble'
  aspect.name = 'Spaghetti'
end


# Chris

chris = Character.find_or_create_by(name: 'Chris') do |character|
  character.fate_points = 2
  character.refresh = 1
end

Aspect.find_or_create_by(character: chris, position: 1) do |aspect|
  aspect.label = 'High Concept'
  aspect.name = 'Test Player Character'
end

Aspect.find_or_create_by(character: chris, position: 2) do |aspect|
  aspect.label = 'Trouble'
  aspect.name = 'Rusty at Ruby'
end
