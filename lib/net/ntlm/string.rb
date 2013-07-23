require 'net/ntlm/field'

module Net
  module NTLM

    class String < Field
      def initialize(opts)
        super(opts)
        @size = opts[:size]
      end

      def parse(str, offset=0)
        if @active and str.size >= offset + @size
          @value = str[offset, @size]
          @size
        else
          0
        end
      end

      def serialize
        if @active
          @value
        else
          ""
        end
      end

      def value=(val)
        @value = val
        @size = @value.nil? ? 0 : @value.size
        @active = (@size > 0)
      end
    end

  end
end