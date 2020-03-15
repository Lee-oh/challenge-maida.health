#run - rackup -p9292 --host 0.0.0.0
Dir[File.dirname(__FILE__)+"/app/controllers/*"].each do |route|
	require route
end

use Rack::MethodOverride
use Rack::Session::Pool, :expire_after => 2592000
use Rack::Protection::RemoteToken
use Rack::Protection::SessionHijacking

use UsersController
use DietsController
use PointsController
run ApplicationController
