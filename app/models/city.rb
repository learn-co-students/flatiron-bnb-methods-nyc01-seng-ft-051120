class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods
  def city_openings(from_date, to_date)
    ls=[]
    rv=[]
    uar=[]
    als=[]
    nh= Neighborhood.all.select do |nd|
      nd.id==self.id
    end
    
    nh.each do |n|
      Listing.all.each do |lsg|
        if lsg.id==n.id
          ls<<lsg
        end
      end
    end
    
    
    Reservation.all.each do |rvt|
    ls.each do |lts|
       if rvt.id==lts.id
        rv<<rvt
       end
      end
    end
   
    rv.each do |r|
      if (r.checkin.to_s<from_date && r.checkout.to_s>from_date) || (r.checkin.to_s<to_date && r.checkout.to_s>to_date)
      uar<<r
      end
      byebug
    end
    
    ls.each do |ls|
         uar.each do |ur|
          if ls.id!=ur
          als<<ls
          end
        end
      end

      als
      byebug
    end

end

