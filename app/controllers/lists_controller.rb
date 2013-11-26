require 'fuelsdk'

class ListsController < ApplicationController
	def new
	end

	def create
		
		begin
			stubObj = ET_Client.new({'client' => {'id' => 'xxxxxxxxx','secret' => 'yyyyyyyyyyy'}})
			@list = List.new(params.require(:list).permit(:listname))
			@NewListName = @list.listname

			## Example using AddSubscriberToList() method
			## Typically this method will be used with a pre-existing list but for testing purposes one is being created.

			# Create List
			p '>>> Create List'
			postList = ET_List.new
			postList.authStub = stubObj
			postList.props = {"ListName" => @NewListName, "Description" => "This list was created with the RubySDK", "Type" => "Private" }
			postResponse = postList.post
			p 'Post Status: ' + postResponse.status.to_s
			p 'Code: ' + postResponse.code.to_s
			p 'Message: ' + postResponse.message.to_s
			p 'Result Count: ' + postResponse.results.length.to_s
			p 'Results: ' + postResponse.results.inspect
			redirect_to @list
		  raise 'Failure creating list' unless postResponse.success?

		end

  	end
end
