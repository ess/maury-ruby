require 'spec_helper'
require 'maury/client'

module Maury
  RSpec.describe Client do
    let(:client) {described_class.new(token: 'faketoken')}

    describe '#get' do
      let(:path) {''}
      let(:params) {nil}
      let(:endpoint) {
        e = Addressable::URI.parse("https://api.engineyard.com/#{path}")
        e.query_values = params
        e.to_s
      }

      let(:result) {client.get(path: path, params: params)}

      context 'when on the happy path' do
        let(:path) {'sausages'}

        before(:each) do
          stub_request(:get, endpoint).
            to_return(status: 200, body: '{"sausages":"gold"}')
        end

        it 'is a success' do
          expect(result.ok?).to eql(true)
        end

        it 'has the expected value' do
          expect(result.value).to eql({sausages: 'gold'})
        end
      end

      context 'when on the happy path (with params)' do
        let(:path) {'sausages'}
        let(:params) {{color: 'gold'}}

        before(:each) do
          stub_request(:get, endpoint).
            to_return(status: 200, body: '{"sausages":"yep"}')
        end

        it 'is a success' do
          expect(result.ok?).to eql(true)
        end

        it 'has the expected value' do
          expect(result.value).to eql(sausages: 'yep')
        end
      end

      context 'when a wild API error appears' do
        let(:path) {'ed209'}

        before(:each) do
          stub_request(:get, endpoint).
            to_return(status: 500, body: 'Drop your weapon. You have 20 seconds to comply.')
        end

        it 'is a failure' do
          expect(result.ok?).to eql(false)
        end

        it 'has an error' do
          expect(result.error).not_to be_nil
        end
      end

      context 'when a problem exists between the chair and the keyboard' do
        let(:path) {'404'}

        before(:each) do
          stub_request(:get, endpoint).
            to_return(status: 404, body: 'You are now staring into the void. It is staring back.')
        end

        it 'is a failure' do
          expect(result.ok?).to eql(false)
        end

        it 'has an error' do
          expect(result.error).not_to be_nil
        end
      end
    end


    describe '#post' do
      let(:path) {''}
      let(:params) {nil}
      let(:data) {nil}
      let(:endpoint) {
        e = Addressable::URI.parse("https://api.engineyard.com/#{path}")
        e.query_values = params
        e.to_s
      }

      let(:result) {client.post(path: path, params: params, data: data)}

      context 'when on the happy path' do
        let(:path) {'sausages'}

        before(:each) do
          stub_request(:post, endpoint).
            to_return(status: 200, body: '{"sausages":"gold"}')
        end

        it 'is a success' do
          expect(result.ok?).to eql(true)
        end

        it 'has the expected value' do
          expect(result.value).to eql({sausages: 'gold'})
        end
      end

      context 'when on the happy path (with params)' do
        let(:path) {'sausages'}
        let(:params) {{color: 'gold'}}

        before(:each) do
          stub_request(:post, endpoint).
            to_return(status: 200, body: '{"sausages":"yep"}')
        end

        it 'is a success' do
          expect(result.ok?).to eql(true)
        end

        it 'has the expected value' do
          expect(result.value).to eql(sausages: 'yep')
        end
      end

      context 'when a wild API error appears' do
        let(:path) {'ed209'}

        before(:each) do
          stub_request(:post, endpoint).
            to_return(status: 500, body: 'Drop your weapon. You have 20 seconds to comply.')
        end

        it 'is a failure' do
          expect(result.ok?).to eql(false)
        end

        it 'has an error' do
          expect(result.error).not_to be_nil
        end
      end

      context 'when a problem exists between the chair and the keyboard' do
        let(:path) {'404'}

        before(:each) do
          stub_request(:post, endpoint).
            to_return(status: 404, body: 'You are now staring into the void. It is staring back.')
        end

        it 'is a failure' do
          expect(result.ok?).to eql(false)
        end

        it 'has an error' do
          expect(result.error).not_to be_nil
        end
      end
    end

    describe '#put' do
      let(:path) {''}
      let(:params) {nil}
      let(:data) {nil}
      let(:endpoint) {
        e = Addressable::URI.parse("https://api.engineyard.com/#{path}")
        e.query_values = params
        e.to_s
      }

      let(:result) {client.put(path: path, params: params, data: data)}

      context 'when on the happy path' do
        let(:path) {'sausages'}

        before(:each) do
          stub_request(:put, endpoint).
            to_return(status: 200, body: '{"sausages":"gold"}')
        end

        it 'is a success' do
          expect(result.ok?).to eql(true)
        end

        it 'has the expected value' do
          expect(result.value).to eql({sausages: 'gold'})
        end
      end

      context 'when on the happy path (with params)' do
        let(:path) {'sausages'}
        let(:params) {{color: 'gold'}}

        before(:each) do
          stub_request(:put, endpoint).
            to_return(status: 200, body: '{"sausages":"yep"}')
        end

        it 'is a success' do
          expect(result.ok?).to eql(true)
        end

        it 'has the expected value' do
          expect(result.value).to eql(sausages: 'yep')
        end
      end

      context 'when a wild API error appears' do
        let(:path) {'ed209'}

        before(:each) do
          stub_request(:put, endpoint).
            to_return(status: 500, body: 'Drop your weapon. You have 20 seconds to comply.')
        end

        it 'is a failure' do
          expect(result.ok?).to eql(false)
        end

        it 'has an error' do
          expect(result.error).not_to be_nil
        end
      end

      context 'when a problem exists between the chair and the keyboard' do
        let(:path) {'404'}

        before(:each) do
          stub_request(:put, endpoint).
            to_return(status: 404, body: 'You are now staring into the void. It is staring back.')
        end

        it 'is a failure' do
          expect(result.ok?).to eql(false)
        end

        it 'has an error' do
          expect(result.error).not_to be_nil
        end
      end
    end

    describe '#patch' do
      let(:path) {''}
      let(:params) {nil}
      let(:data) {nil}
      let(:endpoint) {
        e = Addressable::URI.parse("https://api.engineyard.com/#{path}")
        e.query_values = params
        e.to_s
      }

      let(:result) {client.patch(path: path, params: params, data: data)}

      context 'when on the happy path' do
        let(:path) {'sausages'}

        before(:each) do
          stub_request(:patch, endpoint).
            to_return(status: 200, body: '{"sausages":"gold"}')
        end

        it 'is a success' do
          expect(result.ok?).to eql(true)
        end

        it 'has the expected value' do
          expect(result.value).to eql({sausages: 'gold'})
        end
      end

      context 'when on the happy path (with params)' do
        let(:path) {'sausages'}
        let(:params) {{color: 'gold'}}

        before(:each) do
          stub_request(:patch, endpoint).
            to_return(status: 200, body: '{"sausages":"yep"}')
        end

        it 'is a success' do
          expect(result.ok?).to eql(true)
        end

        it 'has the expected value' do
          expect(result.value).to eql(sausages: 'yep')
        end
      end

      context 'when a wild API error appears' do
        let(:path) {'ed209'}

        before(:each) do
          stub_request(:patch, endpoint).
            to_return(status: 500, body: 'Drop your weapon. You have 20 seconds to comply.')
        end

        it 'is a failure' do
          expect(result.ok?).to eql(false)
        end

        it 'has an error' do
          expect(result.error).not_to be_nil
        end
      end

      context 'when a problem exists between the chair and the keyboard' do
        let(:path) {'404'}

        before(:each) do
          stub_request(:patch, endpoint).
            to_return(status: 404, body: 'You are now staring into the void. It is staring back.')
        end

        it 'is a failure' do
          expect(result.ok?).to eql(false)
        end

        it 'has an error' do
          expect(result.error).not_to be_nil
        end
      end
    end

    describe '#delete' do
      let(:path) {''}
      let(:params) {nil}
      let(:endpoint) {
        e = Addressable::URI.parse("https://api.engineyard.com/#{path}")
        e.query_values = params
        e.to_s
      }

      let(:result) {client.delete(path: path, params: params)}

      context 'when on the happy path' do
        let(:path) {'sausages'}

        before(:each) do
          stub_request(:delete, endpoint).
            to_return(status: 200, body: '{"sausages":"gold"}')
        end

        it 'is a success' do
          expect(result.ok?).to eql(true)
        end

        it 'has the expected value' do
          expect(result.value).to eql({sausages: 'gold'})
        end
      end

      context 'when on the happy path (with params)' do
        let(:path) {'sausages'}
        let(:params) {{color: 'gold'}}

        before(:each) do
          stub_request(:delete, endpoint).
            to_return(status: 200, body: '{"sausages":"yep"}')
        end

        it 'is a success' do
          expect(result.ok?).to eql(true)
        end

        it 'has the expected value' do
          expect(result.value).to eql(sausages: 'yep')
        end
      end

      context 'when a wild API error appears' do
        let(:path) {'ed209'}

        before(:each) do
          stub_request(:delete, endpoint).
            to_return(status: 500, body: 'Drop your weapon. You have 20 seconds to comply.')
        end

        it 'is a failure' do
          expect(result.ok?).to eql(false)
        end

        it 'has an error' do
          expect(result.error).not_to be_nil
        end
      end

      context 'when a problem exists between the chair and the keyboard' do
        let(:path) {'404'}

        before(:each) do
          stub_request(:delete, endpoint).
            to_return(status: 404, body: 'You are now staring into the void. It is staring back.')
        end

        it 'is a failure' do
          expect(result.ok?).to eql(false)
        end

        it 'has an error' do
          expect(result.error).not_to be_nil
        end
      end
    end
    

  end
end
