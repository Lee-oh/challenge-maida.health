module UserService
    class Query
        def initialize
        end
        def login(username,password)
            begin
                @user = User.find_by(username: username.strip, password: password.strip)
                if @user
                    return @user.id
                else
                    return false
                end
            rescue Exception => e
                return false
            end
        end
        def create(username,email,password)
            begin
                @user = User.new(username: username.strip, email: email.strip, password: password.strip)
                @user.save
                if @user
                    return @user
                else
                    return nil
                end
            rescue Exception => e
                return nil
            end
        end
        def show(id)
            begin
                @user = User.find_by_id(id)
                return @user
            rescue Exception => e
                return false
            end
        end
        def update(id,username,email,password)
            begin
                @user = User.find_by_id(id)
                @user.update_attributes(username: username.strip, email: email.strip, password: password.strip)
                return @user
              rescue Exception => e
                return false
              end
        end
        def delete(id)
            begin
                @user = User.find_by_id(id).destroy
                return true
            rescue Exception => e
                return false
            end 
        end
    end
end