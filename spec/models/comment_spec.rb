RSpec.describe Comment, type: :model do
  describe "Articles has db columns" do
    it { is_expected.to have_db_column :content }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :content }
  end

  describe "Relations" do
    it { is_expected.to belong_to :article }
    it { is_expected.to belong_to :user }
  end

  describe "Factory" do
    it "Should have valid factory" do
      expect(create(:comment)).to be_valid
    end
  end
end
