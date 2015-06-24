RSpec.describe 'Cherry pick features' do
  let(:instance) { subject.new }

  describe ':only' do
    context 'only functions' do
      subject do
        Class.new(Sequoia.open(only: :function))
      end

      it 'works with functions' do
        expect { instance.root('/opt') }.to_not raise_error
      end

      it 'does not work with attribute accessors' do
        expect { instance.root = '/opt' }.to raise_error(NoMethodError)
      end

      it 'does not work with setters' do
        expect { instance.set(:root, '/opt') }.to raise_error(NoMethodError)
      end
    end

    context 'only attribute accessors' do
      subject do
        Class.new(Sequoia.open(only: :attr_accessor))
      end

      it 'does not work with functions' do
        expect { instance.root('/opt') }.to raise_error(NoMethodError) # FIXME getter should be available
      end

      it 'works with attribute accessors' do
        expect { instance.root = '/opt' }.to_not raise_error
      end

      it 'does not work with setters' do
        expect { instance.set(:root, '/opt') }.to raise_error(NoMethodError)
      end
    end

    context 'only setters' do
      subject do
        Class.new(Sequoia.open(only: :setter))
      end

      it 'does not work with functions' do
        expect { instance.root('/opt') }.to raise_error(NoMethodError) # FIXME getter should be available
      end

      it 'does not work with attribute accessors' do
        expect { instance.root = '/opt' }.to raise_error(NoMethodError)
      end

      it 'works with setters' do
        expect { instance.set(:root, '/opt') }.to_not raise_error
      end
    end

    context 'only functions and setters' do
      subject do
        Class.new(Sequoia.open(only: %i(setter function)))
      end

      it 'works with functions' do
        expect { instance.root('/opt') }.to_not raise_error
      end

      it 'does not work with attribute accessors' do
        expect { instance.root = '/opt' }.to raise_error(NoMethodError)
      end

      it 'works with setters' do
        expect { instance.set(:root, '/opt') }.to_not raise_error
      end
    end
  end

  describe ':except' do
    context 'except functions' do
      subject do
        Class.new(Sequoia.open(except: :function))
      end

      it 'does not work with functions' do
        expect { instance.root('/opt') }.to raise_error(NoMethodError) # FIXME getter should be available
      end

      it 'works with attribute accessors' do
        expect { instance.root = '/opt' }.to_not raise_error
      end

      it 'works with setters' do
        expect { instance.set(:root, '/opt') }.to_not raise_error
      end
    end

    context 'except attribute accessors' do
      subject do
        Class.new(Sequoia.open(except: :attr_accessor))
      end

      it 'works with functions' do
        expect { instance.root('/opt') }.to_not raise_error
      end

      it 'does not work with attribute accessors' do
        expect { instance.root = '/opt' }.to raise_error(NoMethodError)
      end

      it 'works with setters' do
        expect { instance.set(:root, '/opt') }.to_not raise_error
      end
    end

    context 'except setters' do
      subject do
        Class.new(Sequoia.open(except: :setter))
      end

      it 'works with functions' do
        expect { instance.root('/opt') }.to_not raise_error
      end

      it 'works with attribute accessors' do
        expect { instance.root = '/opt' }.to_not raise_error
      end

      it 'does not work with setters' do
        expect { instance.set(:root, '/opt') }.to raise_error(NoMethodError)
      end
    end

    context 'except functions and setters' do
      subject do
        Class.new(Sequoia.open(except: %i(setter function)))
      end

      it 'does not work with functions' do
        expect { instance.root('/opt') }.to raise_error(NoMethodError) # FIXME getter should be available
      end

      it 'works with attribute accessors' do
        expect { instance.root = '/opt' }.to_not raise_error
      end

      it 'does not work with setters' do
        expect { instance.set(:root, '/opt') }.to raise_error(NoMethodError)
      end
    end
  end
end
