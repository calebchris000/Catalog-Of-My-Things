require './game/game'

describe Student do
    context '#play_hooky' do
      it 'should return a string with the shrug emoji' do
        student = Student.new(name: 'Musong', age: 21, parent_permission: false, classroom: 'Unknown')
        expect(student.play_hooky).to eq('¯\\_(ツ)_/¯')
      end
    end
  
    context '#add_classroom' do
      it 'should add the student to the given classroom' do
        student = Student.new(name: 'Musong', age: 21, parent_permission: false, classroom: 'Unknown')
        classroom = Classroom.new('Class one')
  
        student.add_classroom(classroom)
  
        expect(classroom.students).to include(student)
      end
  
      it 'should not add the student to the classroom if the student is already in the classroom' do
        student = Student.new(name: 'Musong', age: 21, parent_permission: false, classroom: 'Unknown')
        classroom = Classroom.new('Class one')
  
        student.add_classroom(classroom)
  
        expect { student.add_classroom(classroom) }.not_to change { classroom.students.count }
      end
    end
  end