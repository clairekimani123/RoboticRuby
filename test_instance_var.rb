class Person
    def set_info(county, age)
        @county = county
        @age = age
    end

    def introduce
        puts "She  is from #{@county} and she is #{@age} years old"
    end

    def birthday
        @age +=1
         puts "Happy birthday! Now I'm #{@age}"
    end
end

claire = Person.new
claire.set_info("Claire", 22)
claire.introduce
claire.birthday
claire.introduce

