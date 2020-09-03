class Doctor

    @@all = []
    
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |doctor| 
            doctor.date = self
        end

    end

    def patients
        appointments.collect do |appointment| 
            appointment.patient
        end
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

end