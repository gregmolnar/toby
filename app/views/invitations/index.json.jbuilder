json.array!(@invitations) do |invitation|
  json.extract! invitation, 
  json.url invitation_url(invitation, format: :json)
end
