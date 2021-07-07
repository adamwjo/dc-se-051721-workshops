RSpec.describe "Models" do
  describe "Post" do 
    it "inherits from ActiveRecord::Base" do 
      expect(Post.superclass).to eq(ActiveRecord::Base)
    end

    it "connects to the `posts` table" do 
      expect{
        Post.find_or_create_by(
          title: "ActiveRecord Associations cheat sheet",
          author: "Dakota",
          content: "has_many, belongs_to, & has_many, through can work together to create many to many associations between models."
        )
      }.not_to raise_error
    end
  end

  describe "Tag" do 
    it "inherits from ActiveRecord::Base" do 
      expect(Tag.superclass).to eq(ActiveRecord::Base)
    end

    it "connects to the `tags` table" do 
      expect{
        Tag.find_or_create_by(
          name: "ActiveRecord"
        )
      }.not_to raise_error
    end
  end

  describe "PostTag" do 
    it "inherits from ActiveRecord::Base" do 
      expect(PostTag.superclass).to eq(ActiveRecord::Base)
    end

    it "connects to the `post_tags` table" do 
      expect{
        PostTag.find_or_create_by(
          post_id: Post.find_by_title("ActiveRecord Associations cheat sheet").try(:id),
          tag_id: Tag.find_by_name("ActiveRecord").try(:id)
        )
      }.not_to raise_error
    end
  end
end

RSpec.describe "Associations" do 
  let(:post) { Post.find_by_title("ActiveRecord Associations cheat sheet") }
  let(:tag) { Tag.find_by_name("ActiveRecord") }
  let(:post_tag) { 
    PostTag.find_or_create_by(
      post_id: Post.find_by_title("ActiveRecord Associations cheat sheet").try(:id),
      tag_id: Tag.find_by_name("ActiveRecord").try(:id) 
    )
  }
  describe "Post" do 
    it "has_many :post_tags" do 
      expect(Post.new).to respond_to(:post_tags)
      expect(post.post_tags).to include(post_tag)
    end

    it "has many :tags, through: :post_tags" do 
      expect(Post.new).to respond_to(:tags)
      expect(post.tags).to include(tag)
    end
  end

  describe "PostTag" do 
    it "belongs_to :post" do
      expect(PostTag.new).to respond_to(:post)
      expect(post_tag.post).to eq(post)
    end

    it "belongs_to :tag" do
      expect(PostTag.new).to respond_to(:tag)
      expect(post_tag.tag).to eq(tag)
    end
  end

  describe "Tag" do 
    it "has_many :post_tags" do 
      expect(Tag.new).to respond_to(:post_tags)
      expect(tag.post_tags).to include(post_tag)
    end

    it "has many :posts, through: :post_tags" do 
      expect(Tag.new).to respond_to(:posts)
      expect(tag.posts).to include(post)
    end
  end
end