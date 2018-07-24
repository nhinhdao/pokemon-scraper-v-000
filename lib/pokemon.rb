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
    end
    # database.execute("select * from pokemon")

    def self.save(name, type, database)
        database.execute("insert into pokemon (name, type) values (?, ?)", name, type)
    end

    def self.find(num, database)
        a = database.execute("select * from pokemon where id = ?", num)
        Pokemon.save(a[0][1], a[0][2], database)
        # binding.pry
        # Pokemon.all.find do |pk|
        #     if pk.id = num
        #      Pokemon.save(pk.name, pk.type, database)
        #      end
        #  end
        #  database.find("Pikachu")
    end

    def self.all
        @@all
    end
end
