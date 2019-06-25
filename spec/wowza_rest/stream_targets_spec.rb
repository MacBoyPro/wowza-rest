require 'spec_helper'

RSpec.describe WowzaRest::Publishers do
  let(:client) do
    WowzaRest::Client.new(host: '127.0.0.1',
                          port: '8087',
                          username: ENV['WOWZA_USERNAME'],
                          password: ENV['WOWZA_PASSWORD'])
  end

  describe '#create_stream_target' do
    context 'when successfully creates the stream_target' do
      it 'returns true',
         vcr: { cassette_name: 'create_stream_target' } do
        response = client.create_stream_target('stream_name', 'username', 'password')
        expect(response).to be true
      end
    end

    context 'when the stream_target already exists' do
      it 'returns false',
         vcr: { cassette_name: 'create_stream_target' } do
        response = client.create_stream_target('name', 'password')
        expect(response).to be false
      end
    end
  end

  describe '#delete_stream_target' do
    context 'when successfully deletes the publisher' do
      it 'returns true',
         vcr: { cassette_name: 'delete_stream_target' } do
        response = client.delete_stream_target('stream_name')
        expect(response).to be true
      end
    end

    context 'when the stream_target does not exist' do
      it 'returns false',
         vcr: { cassette_name: 'stream_target_not_exists' } do
        response = client.delete_stream_target('not_existent_stream_target_name')
        expect(response).to be false
      end
    end
  end
end
