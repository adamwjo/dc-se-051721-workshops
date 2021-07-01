# We can build more complicated relationships using one to many more than once. 
RSpec.describe "Aquarium has many fish through exhibits" do 
  let(:aquarium) { Aquarium.new(name: "Aquarium of the Pacific")}
  let(:coral_reefs_exhibit) { Exhibit.new(name: "Coral Reefs: Nature's Underwater Cities", aquarium: aquarium)}
  let(:shark_lagoon_exhibit) { Exhibit.new(name: "Shark Lagoon", aquarium: aquarium)}
  let(:glowing_reef) { Fish.new(name: "Deep Reef", exhibit: coral_reefs_exhibit)}
  let(:deep_reef) { Fish.new(name: "Deep Reef", exhibit: coral_reefs_exhibit)}
  let(:clownfish) { Fish.new(name: "Clownfish", exhibit: coral_reefs_exhibit)}
  let(:zebra_shark) { Fish.new(name: "Zebra Shark", exhibit: shark_lagoon_exhibit)}
  let(:grey_reef_shark) {Fish.new(name: "Grey Reef Shark",exhibit: shark_lagoon_exhibit)}
  let(:epaulette_shark){ Fish.new(name: "Epaulette Shark", exhibit: shark_lagoon_exhibit)}
  describe "Aquarium" do 
    describe ".all" do 
      it "returns an array of all aquariums" do 
        aquarium
        expect(Aquarium.all).to include(aquarium)
      end
    end
    describe "#initialize" do 
      it "accepts a hash of attributes as an argument, including a name, and saves the aquarium to @@all" do 
        expect { aquarium }.not_to raise_error
        expect(Aquarium.class_variable_get("@@all")).to include(aquarium)
      end
    end
    describe "#exhibits" do 
      it "(has many exhibits) returns an array of Exhibit objects" do 
        [aquarium, coral_reefs_exhibit, shark_lagoon_exhibit]
        expect(aquarium.exhibits).to include(coral_reefs_exhibit)
        expect(aquarium.exhibits).to include(shark_lagoon_exhibit)
      end
    end
  end

  describe "Exhibit" do 
    describe ".all" do 
      it ".all returns an array of @@all the Exhibits we've created so far" do 
        [coral_reefs_exhibit, shark_lagoon_exhibit]
        expect(Exhibit.all).to include(coral_reefs_exhibit, shark_lagoon_exhibit)
      end
    end

    describe "#initialize" do 
      it "accepts a hash of attributes as an argument, including a name and an aquarium, and saves the exhibit to @@all" do 
        expect { coral_reefs_exhibit }.not_to raise_error
        expect(Exhibit.class_variable_get("@@all")).to include(coral_reefs_exhibit)
      end
    end

    describe "#fish" do 
      it "returns an array of all the fish in this exhibit" do 
        [shark_lagoon_exhibit, zebra_shark, grey_reef_shark, epaulette_shark]
        expect(shark_lagoon_exhibit.fish).to include(zebra_shark, grey_reef_shark, epaulette_shark)
      end
    end
  end

  describe "Fish" do 
    describe ".all" do 
      it ".all returns an array of @@all the Fish we've created so far" do 
        [grey_reef_shark, epaulette_shark]
        expect(Fish.all).to include(grey_reef_shark, epaulette_shark)
      end
    end

    describe "#initialize" do
      it "accepts a hash of attributes as an argument, including a name and an exhibit, and saves the fish to @@all" do 
        expect { grey_reef_shark }.not_to raise_error
        expect(Fish.class_variable_get("@@all")).to include(grey_reef_shark)
      end
    end
  end
  describe "Aquarium (cont'd)" do
    describe "#fish" do 
      it "(has many fish through exhibits) returns an array of Fish objects associated with" do 
        [aquarium, shark_lagoon_exhibit, grey_reef_shark, epaulette_shark]
        expect(aquarium.fish).to include(grey_reef_shark)
        expect(aquarium.fish).to include(epaulette_shark)
      end
    end
  end
end

RSpec.describe "Many to Many Doctor <=> Patient through appointments" do
  let(:drew) { Doctor.new(name: "Dr. Drew") }
  let(:amy) { Patient.new(name: "Amy Adams") }
  let(:appointment) { Appointment.new(time: "2PM", doctor: drew, patient: amy)}
  describe "Basics" do 
    describe "Doctor" do 
      describe ".all" do 
        it "returns an array of all the doctors we have created." do 
          drew
          expect(Doctor.all).to include(drew)
        end
      end
  
      describe "#initialize" do
        it "accepts a hash of attributes as an argument, including a name, and stores the doctor in @@all" do 
          expect{ drew }.not_to raise_error
          expect(Doctor.class_variable_get("@@all")).to include(drew)
        end
      end
    end

    describe "Patient" do 
      describe ".all" do 
        it "returns an array of all the patients we have created." do 
          amy
          expect(Patient.all).to include(amy)
        end
      end
  
      describe "#initialize" do
        it "accepts a hash of attributes as an argument, including a name, and stores the patient in @@all" do 
          expect { amy }.not_to raise_error
          expect(Patient.class_variable_get("@@all")).to include(amy)
        end
      end
    end
  end
  
  describe "Appointment" do 
    describe ".all" do 
      it "returns an array of all appointments created" do
        appointment
        expect(Appointment.all).to include(appointment)
      end
    end

    describe "#initialize" do
      it "takes a hash of attributes as an argument, including a time, doctor and patient, and stores the appointment in @@all" do 
        expect { appointment }.not_to raise_error
        expect(Appointment.class_variable_get("@@all")).to include(appointment)
      end
    end
  end

  describe "Associations" do 
    describe "Appointment" do 
      describe "#doctor (belongs to)" do 
        it "returns the doctor this appointment belongs to" do 
          expect(appointment.doctor).to eq(drew)
        end
      end

      describe "#patient (belongs to)" do 
        it "returns the patient this appointment belongs to" do 
          expect(appointment.patient).to eq(amy)
        end
      end
    end

    describe "Doctor" do 
      describe "#appointments (has_many)" do 
        it "returns an array of appointments that belong to this doctor" do 
          appointment
          expect(drew.appointments).to include(appointment)
        end
      end

      describe "#patients (has_many, through)" do 
        it "returns an array of patients that this doctor has appointments with" do 
          appointment
          expect(drew.patients).to include(amy)
        end
      end
    end

    describe "Patient" do 
      describe "#appointments (has_many)" do 
        it "returns an array of appointments that belong to this patient" do 
          appointment
          expect(amy.appointments).to include(appointment)
        end
      end

      describe "#doctors (has_many, through)" do 
        it "returns an array of doctors that this patient has appointments with" do 
          appointment
          expect(amy.doctors).to include(drew)
        end
      end
    end
  end

end