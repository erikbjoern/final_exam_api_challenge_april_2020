RSpec.describe 'POST /api/articles/:id/comments', type: :request do
  let(:article) { create(:article) }
  let(:user) { create(:user) }
  let(:headers) { user.create_new_auth_token }

  describe 'user can comment on an article' do
    describe 'successfully, when authenticated and providing comment content' do
      before do
        post "/api/articles/#{article.id}/comments",
          headers: headers,
          params: {
            content: "I'm leaving a comment"
          }
      end

      it 'returns a 200 response' do
        expect(response).to have_http_status 200 
      end

      it 'returns a success message' do
        expect(response_json['message']).to eq "Your comment was successfully posted"
      end
    end

    describe 'unsuccessfully' do
      describe 'when not authenticated' do
        before do
          post "/api/articles/#{article.id}/comments",
            params: {
              article_id: article.id,
              content: "I'm leaving a comment"
            }
        end

        it 'returns a 401 response' do
          expect(response).to have_http_status 401 
        end

        it 'returns an error message' do
          expect(response_json['errors'][0]).to eq "You need to sign in or sign up before continuing."
        end
      end

      describe 'when not providing comment content' do
        before do
          post "/api/articles/#{article.id}/comments",
            headers: headers,
            params: {
              content: ""
            }
        end

        it 'returns a 422 response' do
          expect(response).to have_http_status 422 
        end

        it 'returns an error message' do
          expect(response_json['message']).to eq "Content can't be blank"
        end
      end
    end
  end
end