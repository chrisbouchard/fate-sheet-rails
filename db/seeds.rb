# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#
# Test User

dev_user =
  User.create!(
    auth0_id: "0CT9cqlpLELq9tAQie8xinZQKOImPjLb@clients"
  )

my_user =
  User.create!(
    auth0_id: "auth0|60d77fc27cd79d006839e407"
  )

#
# Test World

test_world =
  World.create!(
    name: "Test World",
    description: "A test world for testing"
  )

Membership.create!(
  [
    { user: dev_user, world: test_world },
    { user: my_user, world: test_world }
  ]
)

#
# Alice

alice_character =
  Character.create!(
    name: "Alice",
    fate_points: 0,
    refresh: 3,
    power_level: 3,
    skill_points: 10,
    world: test_world
  )

alice_character.aspects.create!(
  [
    { name: "Rails Application Testing Data", label: "High Concept" },
    { name: "I'm Actually a Computer", label: "Trouble" },
    { name: "Created from a Seed" },
    { name: "Dynamically Typed" }
  ]
)

alice_character.skills.create!(
  [
    { name: "Rapport", level: 3 },
    { name: "Resources", level: 2 },
    { name: "Contacts", level: 1 }
  ]
)

alice_character
  .stress_tracks
  .create!(name: "Physical")
  .stress_boxes
  .create!((1...2).map { |level| { level:, checked: false } })

alice_character
  .stress_tracks
  .create!(name: "Mental")
  .stress_boxes
  .create!((1...2).map { |level| { level:, checked: false } })

#
# Bob

bob_character =
  Character.create!(
    name: "Bob",
    fate_points: 1,
    refresh: 2,
    power_level: 3,
    skill_points: 10,
    world: test_world
  )

bob_character.aspects.create!(
  [
    { name: "Artificially Generated Adversary", label: "High Concept" },
    { name: "Spaghetti", label: "Trouble" }
  ]
)

bob_character.skills.create!(
  [
    { name: "Fight", level: 3 },
    { name: "Physique", level: 2 },
    { name: "Shoot", level: 1 }
  ]
)

bob_character
  .stress_tracks
  .create!(name: "Physical")
  .stress_boxes
  .create!((1...3).map { |level| { level:, checked: false } })

bob_character
  .stress_tracks
  .create!(name: "Mental")
  .stress_boxes
  .create!((1...2).map { |level| { level:, checked: false } })

#
# Chris

chris_character =
  Character.create!(
    name: "Chris",
    fate_points: 2,
    refresh: 1,
    power_level: 3,
    skill_points: 10,
    world: test_world
  )

chris_character.aspects.create!(
  [
    { name: "Test Player Character", label: "High Concept" },
    { name: "Rusty at Ruby", label: "Trouble" }
  ]
)

chris_character.skills.create!(
  [
    { name: "Lore", level: 3 },
    { name: "Investigate", level: 2 },
    { name: "Empathy", level: 2 },
    { name: "Notice", level: 1 },
    { name: "Contacts", level: 1 },
    { name: "Crafts", level: 1 }
  ]
)

chris_character
  .stress_tracks
  .create!(name: "Physical")
  .stress_boxes
  .create!((1...2).map { |level| { level:, checked: false } })

chris_character
  .stress_tracks
  .create!(name: "Mental")
  .stress_boxes
  .create!([1, 1, 2].map { |level| { level:, checked: false } })
