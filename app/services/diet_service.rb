module DietService
    class Query
        def initialize
        end
        def get_all(id)
            begin
                @diets = Diet.where(user_id: id)
                return @diets
            rescue Exception => e
                return []
            end
        end
        def create(title,description,schedule,start,finish,period,height,weight,target_weight,user_id)
            begin
                @diet = Diet.new(title: title, description: description, schedule: schedule, start: start, finish: finish, period: period,height: height, weight: weight, target_weight: target_weight, user_id: user_id)
                @diet.save
                return @diet
            rescue Exception => e
                return false
            end
        end
        def show(id)
            begin
                @diet = Diet.find_by_id(id)
                return @diet
            rescue Exception => e
                return false
            end
        end
        def update(id,title,description,schedule,start,finish,period,height,weight,target_weight)
            begin
                @diet = Diet.find_by_id(id)
                @diet.update_attributes(title: title, description: description, schedule: schedule, start: start, finish: finish, period: period,height: height, weight: weight, target_weight: target_weight)
                return @diet
            rescue Exception => e
                return false
            end
        end
        def delete(id)
            begin
                @diet = Diet.find_by_id(id).destroy
                return true
            rescue Exception => e
                return false
            end 
        end
    end
end