module WowzaRest
  module StreamTargets
    def create_stream_target(stream_name, username, password)
      connection.request(
        :post, "/pushpublish/mapentries/#{stream_name}", body: { 
          "serverName": "_defaultServer_",
          "sourceStreamName": stream_name,
          "entryName": stream_name,
          "profile": "rtmp",
          "userName": username,
          "password": password,
          "streamName": stream_name
         }.to_json
      )['success']
    end

    def delete_stream_target(stream_name)
      connection.request(
        :delete, "/pushpublish/mapentries/#{stream_name}"
      )['success']
    end
  end
end
