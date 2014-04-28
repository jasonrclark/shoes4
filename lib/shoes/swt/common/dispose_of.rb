class Shoes
  module Swt
    module Common
      module DisposeOf
        def to_dispose
          @to_dispose ||= []
        end

        def dispose
          to_dispose.each do |dis|
            dis.dispose unless dis.disposed?
          end
        end

        def mark_to_dispose
          value = yield
          to_dispose << value
          value
        end
      end
    end
  end
end
