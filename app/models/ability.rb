class Ability
  include CanCan::Ability

  def initialize(user)

    if user.can?(:show_post)
      can :show, "Post"
    end

    if user.can?(:create_post)
      can :create, "Post"
    end

    if user.can?(:edit_post)
      can :edit, "Post"
    end
    
    if user.can?(:delete_post)
      can :delete, "Post"
    end

  end

  #动态的根据authority来创建can?方法 
  Authority.all.each do |authority|
    split_pinyin = authority.pinyin.split("_")
    action_name, model_name  = split_pinyin.first, split_pinyin.last

    define_method("can_#{authority.pinyin}?") do |action|
      can "#{action_name}", model_name.upcase
    end
  end

end
