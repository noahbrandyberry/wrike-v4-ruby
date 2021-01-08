module WrikeV4
  class Contact
    class << self
      def list(params = {})
        Base.execute(:get, 'contacts', params)
      end

      def details(ids, params = {})
        Base.execute(:get, "contacts/#{ids}", params)
      end
    end
  end
end
