# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#
# Test User

test_user =
  User.create!(
    auth0_id: 'auth0|60d77fc27cd79d006839e407'
  )

#
# Test World

test_world =
  World.create!(
    name: 'Test World',
    description: 'A test world for testing'
  )

Membership.create!(
  user: test_user,
  world: test_world
)

#
# Alice

alice_character =
  Character.create!(
    name: 'Alice',
    fate_points: 0,
    refresh: 3,
    world: test_world
  )

alice_character.aspects.create!(
  [
    { name: 'Rails Application Testing Data', label: 'High Concept' },
    { name: 'I\'m Actually a Computer', label: 'Trouble' },
    { name: 'Created from a Seed' },
    { name: 'Dynamically Typed' }
  ]
)

alice_character.skills.create!(
  [
    { name: 'Rapport', level: 3 },
    { name: 'Resources', level: 2 },
    { name: 'Contacts', level: 1 }
  ]
)

#
# Bob

bob_character =
  Character.create!(
    name: 'Bob',
    fate_points: 1,
    refresh: 2,
    world: test_world
  )

bob_character.aspects.create!(
  [
    { name: 'Artificially Generated Adversary', label: 'High Concept' },
    { name: 'Spaghetti', label: 'Trouble' }
  ]
)

bob_character.skills.create!(
  [
    { name: 'Fight', level: 3 },
    { name: 'Physique', level: 2 },
    { name: 'Shoot', level: 1 }
  ]
)

#
# Chris

chris_character =
  Character.create!(
    name: 'Chris',
    fate_points: 2,
    refresh: 1,
    world: test_world
  )

chris_character.aspects.create!(
  [
    { name: 'Test Player Character', label: 'High Concept' },
    { name: 'Rusty at Ruby', label: 'Trouble' }
  ]
)

chris_character.skills.create!(
  [
    { name: 'Lore', level: 3 },
    { name: 'Investigate', level: 2 },
    { name: 'Empathy', level: 2 },
    { name: 'Notice', level: 1 },
    { name: 'Contacts', level: 1 },
    { name: 'Crafts', level: 1 }
  ]
)
