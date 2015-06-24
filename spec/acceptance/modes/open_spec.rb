RSpec.describe 'Open mode' do
  subject do
    Class.new(Sequoia.open) do
      attribute :root
    end
  end

  let(:instance) { subject.new }

  context 'when attribute defined' do
    context 'with attribute writer' do
      it 'does not throw an error' do
        expect { instance.root = '/opt' }.to_not raise_error
      end

      it 'assigns value' do
        instance.root = '/opt'

        expect(instance.root).to eql('/opt')
      end
    end

    context 'with method' do
      it 'does not throw an error' do
        expect { instance.root('/opt') }.to_not raise_error
      end

      it 'assigns value' do
        instance.root('/opt')

        expect(instance.root).to eql('/opt')
      end
    end

    context 'with set' do
      it 'does not throw an error' do
        expect { instance.set(:root, '/opt') }.to_not raise_error
      end

      it 'assigns value' do
        instance.set(:root, '/opt')

        expect(instance.root).to eql('/opt')
      end
    end
  end

  context 'when attribute not defined' do
    context 'with attribute writer' do
      it 'throws an error' do
        expect { instance.name = 'joe' }.to_not raise_error
      end

      it 'assigns value' do
        instance.name = 'joe' catch nil

        expect(instance.name).to eql('joe')
      end
    end

    context 'with method' do
      it 'throws an error' do
        expect { instance.name('joe') }.to_not raise_error
      end

      it 'assigns value' do
        instance.name = 'joe' catch nil

        expect(instance.name).to eql('joe')
      end
    end

    context 'with set' do
      it 'throws an error' do
        expect { instance.set(:name, 'joe') }.to_not raise_error
      end

      it 'assigns value' do
        instance.set(:name, 'joe')

        expect(instance.name).to eql('joe')
      end
    end
  end
end
