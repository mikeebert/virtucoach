User.destroy_all
User.create first_name: "Mike", last_name: "Ebert", email: "mike@me.com", password: "test", password_confirmation: "test"
User.create first_name: "Rosa", last_name: "SanMarchi", email: "rosa@me.com", password: "test", password_confirmation: "test"
User.create first_name: "Mike", last_name: "Farrell", email: "farrell@me.com", password: "test", password_confirmation: "test"

require 'date'

      
User.all.each do |user|
  4.times do
    user.workouts.create([
          {name: "HC Workout", description: "2 sets of 5 efforts. 5 min @ 105rpm. 1 min rest between efforts. 3 min rest between sets", duration:60, RPE:6},
          {name:"EASY", description:"Light spin", duration:30, RPE:2},
          {name:"4 mi run", description: "4 mile TT run", duration:30, RPE:8},
          {name:"3 hour ride", description:"3 hours steady tempo. Cadence: 95-105", duration:180, RPE:6},
          {name:"Sprints", description:"3 sets of 6 sprints. 15 seconds @ MAX. 2 min between efforts. 5 min between sets.", duration:60, RPE:10},
          {name:"VO2 workout", description:"3 sets of 4 efforts. 4 min @ RPE:8. 4 min between efforts. 6 min between sets.", duration:120, RPE:8},
          {name:"Core & Stretch", description:"30 min of core & stretching exercises", duration:30, RPE:2}])
  end

  date = Date.today.prev_week
  user.workouts.all.each do |workout|
    workout.date = date
    workout.save    
    date = date.next
  end
end
    