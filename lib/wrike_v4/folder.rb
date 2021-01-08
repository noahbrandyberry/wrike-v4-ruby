module WrikeV4
  class Folder
    class << self
      def tree(folderable_type = nil, folderable_id = nil, params = {})
        Base.execute(:get, Base.nested_path('folders', folderable_type, folderable_id), params)
      end

      def details(id, params = {})
        Base.execute(:get, "folders/#{id}", params)
      end

      def create(folder_id = nil, params = {})
        create_path = "folders#{(folder_id.present? ? "/#{folder_id}/folders" : '')}"
        Base.execute(:post, create_path, params)
      end
  
      def update(id, params = {})
        Base.execute(:put, "folders/#{id}", params)
      end
  
      # Delete folders and all descendants
      def delete(id, params = {})
        Base.execute(:delete, "folders/#{id}", params)
      end
    end
  end
end