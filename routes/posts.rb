class Posts < Cuba
  define do
    on "posts" do
      render("home", title: "Home", posts: posts)
    end

    on "post/:id" do |id|
      post = find_post(id)

      render("post", title: post.title, post: post)
    end

    on default do
      res.redirect "/posts"
    end
  end
end