Sequel.migration do
  change do
    create_table(:accommodation) do
      primary_key :id, :type=>"int(10) unsigned"
      column :name, "varchar(255)", :null=>false
      column :slug, "varchar(255)"
      column :location, "varchar(255)"
      column :image_id, "int(10) unsigned"
      column :official_rating, "varchar(255)"
      column :b_v_rating, "varchar(255)"
      column :from_price, "decimal(8,2)"
      column :resort_fee_applicable, "varchar(255)"
      column :minimum_stay, "varchar(255)"
      column :b_v_added_value, "text"
      column :our_recommendation, "text"
      column :preferred_status, "tinyint(1)", :default=>false, :null=>false
      column :highlights, "text"
      column :accommodation_type, "varchar(255)"
      column :latitude, "double(11,6)"
      column :longitude, "double(11,6)"
      column :meta_title, "varchar(255)"
      column :meta_description, "text"
      column :meta_keywords, "text"
      column :summary, "text"
      column :created, "datetime"
      column :modified, "datetime"
      column :map_latitude, "float"
      column :map_longitude, "float"
      column :zoom_level, "int(2)"
      column :map_type, "varchar(16)", :default=>"roadmap", :null=>false
      column :streetview, "varchar(255)"
      column :published, "tinyint(1)", :default=>false, :null=>false
    end
    
    create_table(:accommodation_accommodation_characteristics) do
      column :accommodation_id, "int(10) unsigned", :null=>false
      column :accommodation_characteristic_id, "int(10) unsigned", :null=>false
      
      primary_key [:accommodation_id, :accommodation_characteristic_id]
      
      index [:accommodation_id, :accommodation_characteristic_id], :name=>:accommodation_id, :unique=>true
    end
    
    create_table(:accommodation_accommodation_facilities) do
      column :accommodation_id, "int(10) unsigned", :null=>false
      column :accommodation_facility_id, "int(10) unsigned", :null=>false
      
      primary_key [:accommodation_id, :accommodation_facility_id]
      
      index [:accommodation_id, :accommodation_facility_id], :name=>:accommodation_id, :unique=>true
    end
    
    create_table(:accommodation_characteristics) do
      primary_key :id, :type=>"int(10) unsigned"
      column :name, "varchar(255)", :null=>false
      column :created, "datetime"
      column :modified, "datetime"
    end
    
    create_table(:accommodation_destinations) do
      primary_key :id, :type=>"int(10) unsigned"
      column :accommodation_id, "int(10) unsigned", :null=>false
      column :destination_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:accommodation_id], :name=>:accommodation_id
      index [:destination_id], :name=>:destination_id
    end
    
    create_table(:accommodation_facilities) do
      primary_key :id, :type=>"int(10) unsigned"
      column :name, "varchar(255)", :null=>false
      column :created, "datetime"
      column :modified, "datetime"
    end
    
    create_table(:accommodation_holiday_types) do
      primary_key :id, :type=>"int(10) unsigned"
      column :accommodation_id, "int(10) unsigned", :null=>false
      column :holiday_type_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:accommodation_id], :name=>:accommodation_id
      index [:holiday_type_id], :name=>:destination_id
    end
    
    create_table(:accommodation_images) do
      primary_key :id, :type=>"int(10) unsigned"
      column :accommodation_id, "int(10) unsigned", :null=>false
      column :image_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      
      index [:accommodation_id], :name=>:destination_id
      index [:image_id], :name=>:image_id
    end
    
    create_table(:accommodations_testimonials) do
      primary_key :id, :type=>"int(11)"
      column :accommodation_id, "int(11)"
      column :testimonial_id, "int(11)"
      column :order, "int(10)"
      column :featured, "tinyint(1)", :default=>false
    end
    
    create_table(:acos) do
      primary_key :id, :type=>"int(10)"
      column :parent_id, "int(10)"
      column :model, "varchar(255)"
      column :foreign_key, "int(10)"
      column :alias, "varchar(255)"
      column :lft, "int(10)"
      column :rght, "int(10)"
      
      index [:lft, :rght], :name=>:acos_idx1
      index [:alias], :name=>:alias
      index [:foreign_key, :lft], :name=>:foreign_key
      index [:parent_id], :name=>:parent_id
    end
    
    create_table(:activities) do
      primary_key :id, :type=>"int(10) unsigned"
      column :name, "varchar(255)", :null=>false
      column :slug, "varchar(255)"
      column :image_id, "int(10) unsigned"
      column :meta_title, "varchar(255)"
      column :meta_description, "text"
      column :meta_keywords, "text"
      column :summary, "text"
      column :expiry_date, "date", :default=>Date.new(2020, 1, 1), :null=>false
      column :created, "datetime"
      column :modified, "datetime"
      column :published, "tinyint(1)", :default=>false, :null=>false
      
      index [:image_id], :name=>:image_id
    end
    
    create_table(:activities_destinations) do
      primary_key :id, :type=>"int(10) unsigned"
      column :activity_id, "int(10) unsigned", :null=>false
      column :destination_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:activity_id], :name=>:activity_id
      index [:destination_id], :name=>:destination_id
    end
    
    create_table(:activities_holiday_types) do
      primary_key :id, :type=>"int(10) unsigned"
      column :activity_id, "int(10) unsigned", :null=>false
      column :holiday_type_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:activity_id], :name=>:activity_id
      index [:holiday_type_id], :name=>:destination_id
    end
    
    create_table(:activities_testimonials) do
      primary_key :id, :type=>"int(11)"
      column :activity_id, "int(11)"
      column :testimonial_id, "int(11)"
      column :order, "int(10)"
      column :featured, "tinyint(1)", :default=>false
    end
    
    create_table(:aros) do
      primary_key :id, :type=>"int(10)"
      column :parent_id, "int(10)"
      column :model, "varchar(255)"
      column :foreign_key, "int(10)"
      column :alias, "varchar(255)"
      column :lft, "int(10)"
      column :rght, "int(10)"
      
      index [:model, :foreign_key], :name=>:aro
    end
    
    create_table(:aros_acos) do
      primary_key :id, :type=>"int(10)"
      column :aro_id, "int(10)", :null=>false
      column :aco_id, "int(10)", :null=>false
      column :_create, "varchar(2)", :default=>"0", :null=>false
      column :_read, "varchar(2)", :default=>"0", :null=>false
      column :_update, "varchar(2)", :default=>"0", :null=>false
      column :_delete, "varchar(2)", :default=>"0", :null=>false
      
      index [:aro_id, :aco_id], :name=>:ARO_ACO_KEY, :unique=>true
    end
    
    create_table(:contacts) do
      primary_key :id, :type=>"int(10) unsigned"
      column :type, "varchar(255)"
      column :title, "varchar(255)"
      column :firstname, "varchar(255)"
      column :lastname, "varchar(255)"
      column :email, "varchar(255)"
      column :telephone, "varchar(255)"
      column :preferred_day, "varchar(255)"
      column :preferred_time, "varchar(255)"
      column :optin, "tinyint(1) unsigned", :default=>false, :null=>false
      column :question, "text"
      column :created, "datetime"
      column :modified, "datetime"
    end
    
    create_table(:content_blocks) do
      primary_key :id, :type=>"int(10) unsigned"
      column :image_id, "int(10) unsigned"
      column :alignment, "varchar(255)"
      column :content, "text"
      column :model, "varchar(255)", :null=>false
      column :modelid, "int(10) unsigned", :null=>false
      column :link_text, "varchar(255)"
      column :link, "varchar(255)"
      column :order, "int(10) unsigned", :null=>false
      column :youtube_video_id, "varchar(255)"
      
      index [:image_id], :name=>:image_id
      index [:modelid], :name=>:model_id
    end
    
    create_table(:custom_image_versions) do
      primary_key :id, :type=>"int(10) unsigned"
      column :image_id, "int(10) unsigned", :null=>false
      column :image_version_id, "int(10) unsigned", :null=>false
      column :source_left_offset, "int(10) unsigned", :null=>false
      column :source_top_offset, "int(10) unsigned", :null=>false
      column :source_width, "int(10) unsigned", :null=>false
      column :source_height, "int(10) unsigned", :null=>false
    end
    
    create_table(:destinations) do
      primary_key :id, :type=>"int(10) unsigned"
      column :parent_id, "int(10) unsigned"
      column :lft, "int(10) unsigned"
      column :rght, "int(10) unsigned"
      column :child_count, "int(10) unsigned", :default=>0, :null=>false
      column :direct_child_count, "int(10) unsigned", :default=>0, :null=>false
      column :latitude, "float"
      column :longitude, "float"
      column :zoom_level, "int(2)"
      column :map_type, "varchar(16)", :default=>"roadmap", :null=>false
      column :streetview, "varchar(255)"
      column :name, "varchar(255)", :null=>false
      column :slug, "varchar(255)"
      column :overview, "text"
      column :main_image_id, "int(10) unsigned"
      column :meta_title, "varchar(255)"
      column :meta_description, "text"
      column :meta_keywords, "text"
      column :created, "datetime"
      column :modified, "datetime"
      column :map_latitude, "float"
      column :map_longitude, "float"
      column :published, "tinyint(1)", :default=>false, :null=>false
      column :google_tracking, "text"
      column :youtube_playlist_id, "varchar(16)"
      column :banner_image_id, "int(10) unsigned"
      
      index [:slug], :name=>:slug, :unique=>true
    end
    
    create_table(:destinations_images) do
      primary_key :id, :type=>"int(10) unsigned"
      column :destination_id, "int(10) unsigned", :null=>false
      column :image_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:destination_id], :name=>:destination_id
      index [:image_id], :name=>:image_id
    end
    
    create_table(:destinations_itineraries) do
      primary_key :id, :type=>"int(10) unsigned"
      column :destination_id, "int(10) unsigned", :null=>false
      column :itinerary_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:destination_id], :name=>:destination_id
      index [:itinerary_id], :name=>:itinerary_id
    end
    
    create_table(:destinations_landing_pages) do
      primary_key :id, :type=>"int(10) unsigned"
      column :destination_id, "int(10) unsigned", :null=>false
      column :landing_page_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:destination_id, :landing_page_id], :name=>:UNIQUE, :unique=>true
      index [:destination_id], :name=>:destination_id
    end
    
    create_table(:destinations_on_holiday_types) do
      primary_key :id, :type=>"int(10) unsigned"
      column :destination_id, "int(10) unsigned", :null=>false
      column :holiday_type_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:destination_id, :holiday_type_id], :name=>:UNIQUE, :unique=>true
      index [:destination_id], :name=>:destination_id
    end
    
    create_table(:destinations_testimonials) do
      primary_key :id, :type=>"int(11)"
      column :destination_id, "int(11)"
      column :testimonial_id, "int(11)"
      column :order, "int(10)"
      column :featured, "tinyint(1)", :default=>false
    end
    
    create_table(:download_folders) do
      primary_key :id, :type=>"int(10) unsigned"
      column :parent_id, "int(10) unsigned"
      column :lft, "int(10) unsigned"
      column :rght, "int(10) unsigned"
      column :child_count, "int(10) unsigned", :default=>0, :null=>false
      column :direct_child_count, "int(10) unsigned", :default=>0, :null=>false
      column :download_count, "int(11)"
      column :name, "varchar(255)", :null=>false
      column :created, "datetime", :null=>false
      column :modified, "datetime", :null=>false
    end
    
    create_table(:downloads) do
      primary_key :id, :type=>"int(11)"
      column :download_folder_id, "int(11)"
      column :extension, "varchar(4)"
      column :name, "varchar(255)"
      column :size, "int(11)"
      column :created, "datetime"
      column :modified, "datetime"
    end
    
    create_table(:faqs) do
      primary_key :id, :type=>"int(10) unsigned"
      column :question, "varchar(255)", :null=>false
      column :answer, "text", :null=>false
      column :order, "int(10) unsigned"
      column :created, "datetime", :null=>false
      column :modified, "datetime", :null=>false
    end
    
    create_table(:groups) do
      primary_key :id, :type=>"int(10) unsigned"
      column :name, "varchar(255)", :null=>false
      column :created, "datetime"
      column :modified, "datetime"
    end
    
    create_table(:holiday_types) do
      primary_key :id, :type=>"int(10) unsigned"
      column :name, "varchar(255)", :null=>false
      column :slug, "varchar(255)"
      column :image_id, "int(10) unsigned"
      column :banner_image_id, "int(10)"
      column :main_image_id, "int(10) unsigned"
      column :meta_title, "varchar(255)"
      column :meta_description, "text"
      column :meta_keywords, "text"
      column :summary, "text"
      column :overview, "text"
      column :order, "int(10) unsigned"
      column :created, "datetime"
      column :modified, "datetime"
      column :published, "tinyint(1)", :default=>false, :null=>false
      column :google_tracking, "text"
      
      index [:image_id], :name=>:image_id
    end
    
    create_table(:holiday_types_itineraries) do
      primary_key :id, :type=>"int(10) unsigned"
      column :holiday_type_id, "int(10) unsigned", :null=>false
      column :itinerary_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:holiday_type_id], :name=>:destination_id
      index [:itinerary_id], :name=>:itinerary_id
    end
    
    create_table(:holiday_types_landing_pages) do
      primary_key :id, :type=>"int(10) unsigned"
      column :holiday_type_id, "int(10) unsigned", :null=>false
      column :landing_page_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:landing_page_id, :holiday_type_id], :name=>:UNIQUE, :unique=>true
      index [:landing_page_id], :name=>:landing_page_id
    end
    
    create_table(:holiday_types_on_destinations) do
      primary_key :id, :type=>"int(10) unsigned"
      column :destination_id, "int(10) unsigned", :null=>false
      column :holiday_type_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:destination_id, :holiday_type_id], :name=>:UNIQUE, :unique=>true
      index [:destination_id], :name=>:destination_id
    end
    
    create_table(:holiday_types_testimonials) do
      primary_key :id, :type=>"int(11)"
      column :holiday_type_id, "int(11)"
      column :testimonial_id, "int(11)"
      column :order, "int(10)"
      column :featured, "tinyint(1)", :default=>false
    end
    
    create_table(:image_folders) do
      primary_key :id, :type=>"int(10) unsigned"
      column :parent_id, "int(10) unsigned"
      column :lft, "int(10) unsigned"
      column :rght, "int(10) unsigned"
      column :child_count, "int(10) unsigned", :default=>0, :null=>false
      column :direct_child_count, "int(10) unsigned", :default=>0, :null=>false
      column :name, "varchar(255)", :null=>false
      column :created, "datetime"
      column :modified, "datetime"
    end
    
    create_table(:image_versions) do
      primary_key :id, :type=>"int(10) unsigned"
      column :name, "varchar(255)", :null=>false
      column :usage, "varchar(255)"
      column :type, "varchar(255)"
      column :width, "int(10) unsigned", :default=>0, :null=>false
      column :height, "int(10) unsigned", :default=>0, :null=>false
      column :force_resize, "tinyint(1) unsigned", :default=>false, :null=>false
      column :created, "datetime", :null=>false
      column :modified, "datetime", :null=>false
    end
    
    create_table(:images) do
      primary_key :id, :type=>"int(10) unsigned"
      column :alt, "varchar(255)"
      column :image_folder_id, "int(10) unsigned"
      column :extension, "varchar(4)", :null=>false
      column :versions, "text"
      column :do_not_resize, "tinyint(1) unsigned", :default=>false, :null=>false
      column :created, "datetime"
      column :modified, "datetime"
      column :published, "tinyint(1)", :default=>false, :null=>false
    end
    
    create_table(:images_spotlights) do
      primary_key :id, :type=>"int(10) unsigned"
      column :image_id, "int(10) unsigned"
      column :spotlight_id, "int(10) unsigned"
      column :order, "int(10) unsigned"
      
      index [:image_id], :name=>:Image
      index [:spotlight_id], :name=>:Spotlight
    end
    
    create_table(:itineraries) do
      primary_key :id, :type=>"int(10) unsigned"
      column :name, "varchar(255)", :null=>false
      column :slug, "varchar(255)"
      column :image_id, "int(10) unsigned"
      column :meta_title, "varchar(255)"
      column :meta_description, "text"
      column :meta_keywords, "text"
      column :summary, "text"
      column :from_price, "float"
      column :map_latitude, "float(11,6)", :null=>false
      column :map_longitude, "float(11,6)", :null=>false
      column :zoom_level, "tinyint(2) unsigned", :default=>0, :null=>false
      column :map_type, "varchar(16)", :default=>"roadmap", :null=>false
      column :created, "datetime"
      column :modified, "datetime"
      column :published, "tinyint(1)", :default=>false, :null=>false
      column :google_tracking, "text"
    end
    
    create_table(:itineraries_testimonials) do
      primary_key :id, :type=>"int(11)"
      column :itinerary_id, "int(11)"
      column :testimonial_id, "int(11)"
      column :order, "int(10)"
      column :featured, "tinyint(1)", :default=>false
    end
    
    create_table(:itinerary_days) do
      primary_key :id, :type=>"int(10) unsigned"
      column :itinerary_id, "int(10) unsigned", :null=>false
      column :order, "tinyint(3) unsigned", :null=>false
      column :day_number, "varchar(255)"
      column :name, "varchar(255)"
      column :miles, "int(10) unsigned"
      column :detail, "text"
      column :image_id, "int(10) unsigned"
      column :latitude, "float(11,6)", :null=>false
      column :longitude, "float(11,6)", :null=>false
      column :created, "datetime"
      column :modified, "datetime"
      column :location, "varchar(255)"
      
      index [:itinerary_id], :name=>:itinerary_id
    end
    
    create_table(:landing_pages) do
      primary_key :id, :type=>"int(10) unsigned"
      column :name, "varchar(255)", :null=>false
      column :slug, "varchar(255)"
      column :main_image_id, "int(10)"
      column :meta_title, "varchar(255)"
      column :meta_description, "text"
      column :meta_keywords, "text"
      column :youtube_playlist_id, "varchar(16)"
      column :order, "int(10) unsigned"
      column :summary, "text"
      column :created, "datetime"
      column :modified, "datetime"
      column :published, "tinyint(1) unsigned", :default=>false, :null=>false
      column :google_tracking, "text"
    end
    
    create_table(:landing_pages_accommodations) do
      primary_key :id, :type=>"int(10) unsigned"
      column :accommodation_id, "int(10) unsigned", :null=>false
      column :landing_page_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:accommodation_id], :name=>:accommodation_id
      index [:landing_page_id], :name=>:destination_id
    end
    
    create_table(:landing_pages_activities) do
      primary_key :id, :type=>"int(10) unsigned"
      column :activity_id, "int(10) unsigned", :null=>false
      column :landing_page_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:activity_id], :name=>:activity_id
      index [:landing_page_id], :name=>:landing_page_id
    end
    
    create_table(:landing_pages_images) do
      primary_key :id, :type=>"int(10) unsigned"
      column :landing_page_id, "int(10) unsigned", :null=>false
      column :image_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:image_id], :name=>:image_id
      index [:landing_page_id], :name=>:landing_page_id
    end
    
    create_table(:landing_pages_itineraries) do
      primary_key :id, :type=>"int(10) unsigned"
      column :landing_page_id, "int(10) unsigned", :null=>false
      column :itinerary_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      column :featured, "tinyint(1) unsigned", :default=>false, :null=>false
      
      index [:itinerary_id], :name=>:itinerary_id
      index [:landing_page_id], :name=>:landing_page_id
    end
    
    create_table(:pages) do
      primary_key :id, :type=>"int(10) unsigned"
      column :parent_id, "int(10) unsigned"
      column :lft, "int(10) unsigned"
      column :rght, "int(10) unsigned"
      column :child_count, "int(10) unsigned"
      column :direct_child_count, "int(10) unsigned"
      column :css_class, "varchar(255)"
      column :internal_ref, "varchar(255)"
      column :navigation_label, "varchar(255)"
      column :image_id, "int(10) unsigned"
      column :slug, "varchar(255)"
      column :meta_title, "varchar(255)"
      column :meta_description, "text"
      column :meta_keywords, "text"
      column :created, "datetime"
      column :modified, "datetime"
      column :published, "tinyint(1)", :default=>false, :null=>false
      column :google_tracking, "text"
    end
    
    create_table(:press_releases) do
      primary_key :id, :type=>"int(11) unsigned"
      column :name, "varchar(255)", :null=>false
      column :slug, "varchar(255)", :null=>false
      column :image_id, "int(11)", :null=>false
      column :summary, "text", :null=>false
      column :order, "int(11)", :null=>false
      column :published, "tinyint(1) unsigned", :default=>false, :null=>false
      column :google_tracking, "text", :null=>false
      column :created, "datetime", :null=>false
      column :modified, "datetime", :null=>false
    end
    
    create_table(:press_releases_images) do
      primary_key :id, :type=>"int(10) unsigned"
      column :press_release_id, "int(10) unsigned", :null=>false
      column :image_id, "int(10) unsigned", :null=>false
      column :order, "int(10) unsigned"
      
      index [:image_id], :name=>:image_id
      index [:press_release_id], :name=>:press_release_id
    end
    
    create_table(:quote_requests) do
      primary_key :id, :type=>"int(10) unsigned"
      column :title, "varchar(255)"
      column :firstname, "varchar(255)"
      column :lastname, "varchar(255)"
      column :telephone, "varchar(16)", :null=>false
      column :email, "varchar(255)"
      column :email_optin, "tinyint(3) unsigned", :null=>false
      column :preferred_day, "varchar(255)"
      column :preferred_time, "varchar(255)"
      column :house_num_name, "varchar(255)"
      column :address1, "varchar(255)"
      column :address2, "varchar(255)"
      column :address3, "varchar(255)"
      column :postcode, "varchar(255)"
      column :brochure, "int(3)", :default=>0, :null=>false
      column :news_offers_optin, "int(3)", :default=>0, :null=>false
      column :num_adults, "int(10)", :default=>0, :null=>false
      column :num_children, "int(10) unsigned"
      column :child_age, "varchar(255)"
      column :preferred_date, "varchar(255)"
      column :preferred_duration, "varchar(255)"
      column :flexible, "int(3)", :default=>0, :null=>false
      column :airport, "varchar(255)"
      column :destinations, "text"
      column :suggest, "int(3)", :default=>0, :null=>false
      column :accom_stars, "varchar(32)"
      column :car_size, "varchar(255)"
      column :other_info, "text"
      column :how_heard, "varchar(255)"
      column :newspaper, "varchar(255)"
      column :created, "datetime"
      column :modified, "datetime"
    end
    
    create_table(:spotlights) do
      primary_key :id, :type=>"int(10) unsigned"
      column :name, "varchar(255)"
      column :slug, "varchar(255)"
      column :from_price, "varchar(255)"
      column :image_id, "int(10) unsigned"
      column :banner_image_id, "int(10)"
      column :summary, "text"
      column :meta_title, "varchar(255)"
      column :meta_description, "text"
      column :meta_keywords, "text"
      column :order, "int(10) unsigned"
      column :created, "datetime"
      column :modified, "datetime"
      column :details, "text"
      column :date_and_price_information, "text"
      column :dates_and_prices, "text"
      column :published, "tinyint(1)", :default=>false, :null=>false
      column :google_tracking, "text"
      column :expiry_date, "date", :default=>Date.new(2020, 1, 1), :null=>false
    end
    
    create_table(:testimonials) do
      primary_key :id, :type=>"int(11)"
      column :title, "varchar(255)"
      column :slug, "varchar(255)"
      column :author, "varchar(255)"
      column :date, "date"
      column :image_id, "int(11)"
      column :meta_title, "varchar(255)"
      column :meta_description, "text"
      column :meta_keywords, "text"
      column :summary, "text"
      column :testimonial, "text"
      column :created, "datetime"
      column :modified, "datetime"
      column :published, "tinyint(1)", :default=>false
      column :featured, "tinyint(1)", :default=>false
    end
    
    create_table(:users) do
      primary_key :id, :type=>"int(10) unsigned"
      column :email, "varchar(255)", :null=>false
      column :password, "varchar(255)"
      column :group_id, "int(10) unsigned", :null=>false
      column :created, "datetime"
      column :modified, "datetime"
      
      index [:email], :name=>:email, :unique=>true
    end
    
    create_table(:webadmin_menu) do
      primary_key :id, :type=>"int(10) unsigned"
      column :parent_id, "int(10) unsigned"
      column :lft, "int(10) unsigned"
      column :rght, "int(10) unsigned"
      column :child_count, "int(10) unsigned"
      column :direct_child_count, "int(10) unsigned"
      column :text, "varchar(255)"
      column :aco_id, "int(10) unsigned"
      column :created, "datetime"
      column :modified, "datetime"
    end
    
    create_table(:webadmin_user_profiles) do
      primary_key :id, :type=>"int(10) unsigned"
      column :user_id, "int(10) unsigned"
      column :name, "varchar(255)"
      column :last_login, "datetime"
      column :created, "datetime"
      column :modified, "datetime"
      
      index [:user_id], :name=>:user_id, :unique=>true
    end
  end
end
