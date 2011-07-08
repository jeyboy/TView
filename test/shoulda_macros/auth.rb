class ActiveSupport::TestCase < Test::Unit::TestCase
  class << self


    def signed_in_admin_context(&blk)
      context "As a signed in admin," do
        setup do
          @admin = Factory :admin          
          sign_in @admin
        end

        merge_block(&blk)
      end
    end

  end
end