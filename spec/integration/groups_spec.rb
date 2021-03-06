#
# Copyright (C) 2011 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GroupsController do
  it "should generate the correct 'Add Announcement' link" do
    course_with_teacher_logged_in(:active_all => true, :user => user_with_pseudonym)
    @group = Group.create!(:name => "group1", :category => "worldCup", :context => @course)
    
    get "/courses/#{@course.id}/groups/#{@group.id}"
    response.should be_success
    
    html = Nokogiri::HTML(response.body)
    html.css('.floating_links a.add').attribute("href").text.should == "/groups/#{@group.id}/announcements#new"
  end
end
