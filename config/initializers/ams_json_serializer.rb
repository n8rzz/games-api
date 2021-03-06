api_mime_types = %W(
text/x-json
application/json
)

Mime::Type.unregister :json
Mime::Type.register 'application/json', :json, api_mime_types

ActiveModel::Serializer.config.adapter = ActiveModel::Serializer::Adapter::JsonApi
