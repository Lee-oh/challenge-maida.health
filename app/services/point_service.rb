module PointService
    class Query
        def initialize
        end
        def get_all(id)
            begin
                @points = Point.where(diet_id: id)
                return @points
            rescue Exception => e
                return []
            end
        end
        def create(title,schedule,weight,diet_id)
            begin
                @point = Point.new(title: title.strip, schedule: schedule.strip, weight: weight.strip, diet_id: diet_id)
                @point.save
                if @point
                    return @point
                else
                    return nil
                end
            rescue Exception => e
                return nil
            end
        end
        def show(id)
            begin
                @point = Point.find_by_id(id)
                return @point
            rescue Exception => e
                return false
            end
        end
        def update(id,title,schedule,weight)
            begin
                @point = Point.find_by_id(id)
                @point.update_attributes(title: title, schedule: schedule, weight: weight)
                return @point
            rescue Exception => e
                return false
            end
        end
        def delete(id)
            begin
                @point = Point.find_by_id(id).destroy
                return true
            rescue Exception => e
                return false
            end 
        end
    end
end