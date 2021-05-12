require 'rspec'
require './lib/classroom'

describe Classroom do
  context 'Attributes' do
    it 'is a classroom' do
      classroom = Classroom.new('History', 4)
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'has a subject' do
      classroom = Classroom.new('History', 4)
      expect(classroom.subject).to eq('History')
    end

    it 'has a capacity' do
      classroom = Classroom.new('History', 4)
      expect(classroom.capacity).to eq 4
    end

    it 'has no students by default' do
      classroom = Classroom.new('History', 4)
      expect(classroom.students).to eq []
    end
  end

  # Iteration 2

  context 'Students' do
    it 'returns a list of students' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')

      expect(classroom.students).to eq ['Mike', 'Megan', 'Bob']
    end

    it 'returns a list of uppercased names' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')

      expect(classroom.yell_at_students).to eq ['MIKE', 'MEGAN', 'BOB']
    end
  end

  # Iteration 3

  context 'Capacity' do
    it "has a set limit" do
      classroom = Classroom.new('History', 4)

      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')

      expect(classroom.over_capacity?).to be false

      classroom.add_student('Eve')
      classroom.add_student('Alice')

      expect(classroom.over_capacity?).to be true
    end
  end

  # Iteration 4

  context 'Kick Out' do
    it "can remove students" do
      classroom = Classroom.new('History', 4)

      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')
      classroom.add_student('James')
      classroom.add_student('Cat')
      classroom.add_student('Alice')

      classroom.kick_out

      expect(classroom.over_capacity?).to be true

      classroom.kick_out

      expect(classroom.over_capacity?).to be false
      expect(classroom.students).to eq(["Bob", "James", "Cat", "Alice"])
    end
  end
end

#   pry(main)> require './lib/classroom'
# #=> true
#
# pry(main)> classroom = Classroom.new('History', 4)
# => #<Classroom:0x00007fed7c11dbd8 @capacity=4, @subject="History", @students=[]>k
#
# pry(main)> classroom.add_student('Mike')
# pry(main)> classroom.add_student('Megan')
# pry(main)> classroom.add_student('Bob')
# pry(main)> classroom.add_student('James')
# pry(main)> classroom.add_student('Cat')
# pry(main)> classroom.add_student('Alice')
#
# pry(main)> classroom.kick_out
#
# pry(main)> classroom.over_capacity?
# => true
#
# pry(main)> classroom.kick_out
#
# pry(main)> classroom.over_capacity?
# => false
#
# pry(main)> classroom.students
# ["Bob", "James", "Cat", "Alice"]
