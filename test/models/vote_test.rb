require "test_helper"

describe Vote do
  let(:vote) { Vote.new }


  # it "must be valid" do
  #   value(vote).must_be :valid?
  # end
  describe "relations" do
    it "relations to both work and user" do
      vote = votes(:vote1)

      # work relation
      vote.must_respond_to :work

      # user relation
      vote.must_respond_to :user
    end
  end

  describe "validations" do
    it "work_id is present, vote is valid" do
      vote = votes(:vote1)
      vote.must_be :valid?
    end

    it "work_id is NOT present, invalid vote" do
      vote = Vote.new

      vote.valid?.must_equal false
      vote.errors.messages.must_include :work_id
    end

    it "user cannot double vote on a work" do
      vote1 =  votes(:vote1)

      # make another vote for the same work from same user.
      vote2 = Vote.create(user_id: users(:user1).id, work_id: works(:work1).id)
      # Prevent vote from being saved to database
      vote2.valid?.must_equal false
      # tell user they cannot vote on the same work

      vote2.errors.messages.must_include :user_id
    end
  end

  describe "make new vote" do
    it "Successfully make new vote" do
      # need user id so make a user
      user_id = User.create!(name: "angela").id
      puts user_id
      work_id = 1
      puts work_id

      start_count = Vote.all.count
      puts "Start count: #{start_count}"

      vote = Vote.new(
        work_id: work_id,
        user_id: user_id
      )

      puts vote
      after_count = Vote.all.count
      puts after_count


      vote.must_be_instance_of Vote
      after_count.must_equal start_count + 1







    end
  end
end
