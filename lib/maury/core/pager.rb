module Maury
  module Core
    module Pager
      PER_PAGE = 100

      def all_pages(api:, path:, params: nil, model:, root:)
        root = root.to_s.downcase.to_sym
        page = 1
        all = []
        batch = [nil]

        params ||= {}
        params['per_page'] = PER_PAGE

        until batch.empty?
          params['page'] = page

          result = api.get(path: path, params: params)

          if result.ok?
            batch = result.value[root] || []
            all += batch.map {|data| model.new(data)}
          end

          if batch.length < PER_PAGE
            break
          end

          page += 1
        end

        all
      end
    end
  end
end
