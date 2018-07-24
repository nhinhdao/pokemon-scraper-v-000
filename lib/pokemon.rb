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
        a = database.execute("select name, type from pokemon where id = ?", num)
        self.new(a[0][0], a[0][1])
        # Pokemon.save(a[0][0], a[0][1], database)
        # binding.pry
        # self.all.find do |pk|
        #     pk.id = num
        #     Pokemon.save(pk.name, pk.type, database)
        # end
    end

    def self.all
        @@all
    end
end
