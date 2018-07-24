require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :hp, :db

    @@all = []

    def initialize(id: nil, name: nil, type: nil, hp: nil, db: nil)
        @id = id
        @name = name
        @type = type
        @hp = hp
        @db = db
        @@all << self
    end

    def alter_hp(hpk, database)
        # binding.pry
        database.execute("UPDATE pokemon set hp = ? where name = ?", hpk, self.name)
        # database.execute("UPDATE pokemon set hp = #{hpk.to_i} where name = '#{self.name}'")
    end
    # it "alters Pikachu's hp to 59" do
    #   pikachu.alter_hp(59, @db)
    #   expect(Pokemon.find(1, @db).hp).to eq(59)
    # database.execute("select * from pokemon")
    # end

    def self.save(name, type, database)
        database.execute("insert into pokemon (name, type) values (?, ?)", name, type)
    end

    def self.find(num, database)
        Pokemon.all.find do |pk|
            if pk.id = num
             Pokemon.save(pk.name, pk.type, database)
             end
         end
    end

    def self.all
        @@all
    end
end
