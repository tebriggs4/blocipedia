class WikiPolicy < ApplicationPolicy
    attr_reader :user, :wiki
    
    def initialize(user, wiki)
        @user = user
        @wiki = wiki
    end
    
    def index?
        true
    end
    
    def show?
        if user
            (user.role == 'admin' || wiki.users.include?(user)|| user == @wiki.user || @wiki.private == false)
        end
    end
    
    def destroy?
        (user.admin? || user == @wiki.user)
    end
        
    class Scope < Scope
        attr_reader :user, :scope

        def initialize(user, scope)
            @user  = user
            @scope = scope
        end
        
        def resolve
            wikis = []
            if user && user.role == "admin"         # if admin, show all wikis
                wikis = scope.all
            elsif user && user.role == 'premium'    # if premium, show public wikis or private wikis they created
                all_wikis = scope.all
                all_wikis.each do |wiki|
                    if (wiki.private == false || wiki.user == user || wiki.users.include?(user))
                        wikis << wiki
                    end
                end
            else                                    # if standard or user not signed in, show public wikis
                all_wikis = scope.all
                all_wikis.each do |wiki|
                    if (wiki.private == false || wiki.users.include?(user))
                        wikis << wiki
                    end
                end
            end
            wikis                                   # return wikis array
        end
    end
  
end