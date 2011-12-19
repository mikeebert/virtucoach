User.destroy_all
user1 = User.create first_name: "Mike", last_name: "Ebert", email: "mike@me.com", password: "test", password_confirmation: "test"
user2 = User.create first_name: "Rosa", last_name: "SanMarchi", email: "rosa@me.com", password: "test", password_confirmation: "test"
user3 = User.create first_name: "Mike", last_name: "Farrell", email: "farrell@me.com", password: "test", password_confirmation: "test"

Relationship.destroy_all
Relationship.create owner_id:user1.id, guest_id: user2.id
Relationship.create guest_id:user1.id, owner_id: user2.id
Relationship.create owner_id:user1.id, guest_id: user3.id
Relationship.create guest_id:user1.id, owner_id: user3.id
Relationship.create guest_id:user3.id, owner_id: user2.id #viewing privelages for user3 but not reciprocal

require 'date'

User.all.each do |user|
  8.times do
    user.workouts.create([
          {name: "HC Workout", description: "2 sets of 5 efforts. 5 min @ 105rpm. 1 min rest between efforts. 3 min rest between sets", duration:60, RPE:6},
          {name:"EASY", description:"Light spin", duration:30, RPE:2},
          {name:"4 mi run", description: "4 mile TT run", duration:30, RPE:8},
          {name:"3 hour ride", description:"3 hours steady tempo. Cadence: 95-105", duration:180, RPE:6},
          {name:"Sprints", description:"3 sets of 6 sprints. 15 seconds @ MAX. 2 min between efforts. 5 min between sets.", duration:60, RPE:10},
          {name:"VO2 workout", description:"3 sets of 4 efforts. 4 min @ RPE:8. 4 min between efforts. 6 min between sets.", duration:120, RPE:8},
          {name:"EASY", description:"Light spin", duration:30, RPE:2},
          {name:"Core & Stretch", description:"30 min of core & stretching exercises", duration:30, RPE:2},
          {name:"VO2 workout", description:"3 sets of 4 efforts. 4 min @ RPE:8. 4 min between efforts. 6 min between sets.", duration:120, RPE:8},
          {name:"3 hour ride", description:"3 hours steady tempo. Cadence: 95-105", duration:180, RPE:6}
    ])
  end
  
  @comments = ["Great workout", 
              "Felt ok. Legs were sore.", 
              "Legs and lungs were burning", 
              "Didn't sleep that well",
              "Rockstar workout!", 
              "Legs are coming around",
              "Can't wait for the next one"]
  @date = Date.today.prev_month
  user.workouts.all.each do |workout|
    workout.date = @date
    workout.save    
    @date = @date.next
    workout.comments.create note:@comments[rand(7)], user_id:user.id
  end
  
end
