require 'spec_helper'

describe 'Code gen: nil' do
  it "codegens nil? for Object gives false" do
    run("Object.new.nil?").to_b.should be_false
  end

  it "codegens nil? for Object gives true" do
    run(%Q(
      class Foo
        def initialize
          if false
            @x = Object.new
          end
          1
        end

        def x
          @x
        end
      end

      Foo.new.x.nil?
      )).to_b.should be_true
  end

  it "codegens nil? for primitives gives false" do
    run("0.nil?").to_b.should be_false
  end
end
