module ApplicationHelper

    def avatar_url(user)
        if user.avatar.present?
            user.vatar.url
        else
            'default_image.png'
        end
    end

end
