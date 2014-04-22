Sequel.migration do
  change do
    create_table(:accommodation) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      String :slug, :size=>255
      String :location, :size=>255
      Bignum :image_id
      String :official_rating, :size=>255
      String :b_v_rating, :size=>255
      BigDecimal :from_price, :size=>[8, 2]
      String :resort_fee_applicable, :size=>255
      String :minimum_stay, :size=>255
      String :b_v_added_value, :text=>true
      String :our_recommendation, :text=>true
      TrueClass :preferred_status, :default=>false, :null=>false
      String :highlights, :text=>true
      String :accommodation_type, :size=>255
      Float :latitude
      Float :longitude
      String :meta_title, :size=>255
      String :meta_description, :text=>true
      String :meta_keywords, :text=>true
      String :summary, :text=>true
      DateTime :created
      DateTime :modified
      Float :map_latitude
      Float :map_longitude
      Integer :zoom_level
      String :map_type, :default=>"roadmap", :size=>16, :null=>false
      String :streetview, :size=>255
      TrueClass :published, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
    end
    
    create_table(:accommodation_accommodation_characteristics, :ignore_index_errors=>true) do
      Bignum :accommodation_id, :null=>false
      Bignum :accommodation_characteristic_id, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:accommodation_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:accommodation_characteristic_id), 0)
      primary_key [:accommodation_id, :accommodation_characteristic_id]
      
      index [:accommodation_id, :accommodation_characteristic_id], :name=>:accommodation_id, :unique=>true
    end
    
    create_table(:accommodation_accommodation_facilities, :ignore_index_errors=>true) do
      Bignum :accommodation_id, :null=>false
      Bignum :accommodation_facility_id, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:accommodation_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:accommodation_facility_id), 0)
      primary_key [:accommodation_id, :accommodation_facility_id]
      
      index [:accommodation_id, :accommodation_facility_id], :name=>:accommodation_id, :unique=>true
    end
    
    create_table(:accommodation_characteristics) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      DateTime :created
      DateTime :modified
    end
    
    create_table(:accommodation_destinations, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :accommodation_id, :null=>false
      Bignum :destination_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:accommodation_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:destination_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:accommodation_id], :name=>:accommodation_id
      index [:destination_id], :name=>:destination_id
    end
    
    create_table(:accommodation_facilities) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      DateTime :created
      DateTime :modified
    end
    
    create_table(:accommodation_holiday_types, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :accommodation_id, :null=>false
      Bignum :holiday_type_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:accommodation_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:holiday_type_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:accommodation_id], :name=>:accommodation_id
      index [:holiday_type_id], :name=>:destination_id
    end
    
    create_table(:accommodation_images, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :accommodation_id, :null=>false
      Bignum :image_id, :null=>false
      Bignum :order
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:accommodation_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:accommodation_id], :name=>:destination_id
      index [:image_id], :name=>:image_id
    end
    
    create_table(:accommodations_testimonials) do
      primary_key :id
      Integer :accommodation_id
      Integer :testimonial_id
      Integer :order
      TrueClass :featured, :default=>false
    end
    
    create_table(:acos, :ignore_index_errors=>true) do
      primary_key :id
      Integer :parent_id
      String :model, :size=>255
      Integer :foreign_key
      String :alias, :size=>255
      Integer :lft
      Integer :rght
      
      index [:lft, :rght], :name=>:acos_idx1
      index [:alias], :name=>:alias
      index [:foreign_key, :lft], :name=>:foreign_key
      index [:parent_id], :name=>:parent_id
    end
    
    create_table(:activities, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      String :slug, :size=>255
      Bignum :image_id
      String :meta_title, :size=>255
      String :meta_description, :text=>true
      String :meta_keywords, :text=>true
      String :summary, :text=>true
      Date :expiry_date, :default=>Date.new(2020, 1, 1), :null=>false
      DateTime :created
      DateTime :modified
      TrueClass :published, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      
      index [:image_id], :name=>:image_id
    end
    
    create_table(:activities_destinations, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :activity_id, :null=>false
      Bignum :destination_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:activity_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:destination_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:activity_id], :name=>:activity_id
      index [:destination_id], :name=>:destination_id
    end
    
    create_table(:activities_holiday_types, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :activity_id, :null=>false
      Bignum :holiday_type_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:activity_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:holiday_type_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:activity_id], :name=>:activity_id
      index [:holiday_type_id], :name=>:destination_id
    end
    
    create_table(:activities_testimonials) do
      primary_key :id
      Integer :activity_id
      Integer :testimonial_id
      Integer :order
      TrueClass :featured, :default=>false
    end
    
    create_table(:aros, :ignore_index_errors=>true) do
      primary_key :id
      Integer :parent_id
      String :model, :size=>255
      Integer :foreign_key
      String :alias, :size=>255
      Integer :lft
      Integer :rght
      
      index [:model, :foreign_key], :name=>:aro
    end
    
    create_table(:aros_acos, :ignore_index_errors=>true) do
      primary_key :id
      Integer :aro_id, :null=>false
      Integer :aco_id, :null=>false
      String :_create, :default=>"0", :size=>2, :null=>false
      String :_read, :default=>"0", :size=>2, :null=>false
      String :_update, :default=>"0", :size=>2, :null=>false
      String :_delete, :default=>"0", :size=>2, :null=>false
      
      index [:aro_id, :aco_id], :name=>:ARO_ACO_KEY, :unique=>true
    end
    
    create_table(:contacts) do
      primary_key :id, :type=>Bignum
      String :type, :size=>255
      String :title, :size=>255
      String :firstname, :size=>255
      String :lastname, :size=>255
      String :email, :size=>255
      String :telephone, :size=>255
      String :preferred_day, :size=>255
      String :preferred_time, :size=>255
      TrueClass :optin, :default=>false, :null=>false
      String :question, :text=>true
      DateTime :created
      DateTime :modified
    end
    
    create_table(:content_blocks, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :image_id
      String :alignment, :size=>255
      String :content, :text=>true
      String :model, :size=>255, :null=>false
      Bignum :modelid, :null=>false
      String :link_text, :size=>255
      String :link, :size=>255
      Bignum :order, :null=>false
      String :youtube_video_id, :size=>255
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:modelid), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:image_id], :name=>:image_id
      index [:modelid], :name=>:model_id
    end
    
    create_table(:custom_image_versions) do
      primary_key :id, :type=>Bignum
      Bignum :image_id, :null=>false
      Bignum :image_version_id, :null=>false
      Bignum :source_left_offset, :null=>false
      Bignum :source_top_offset, :null=>false
      Bignum :source_width, :null=>false
      Bignum :source_height, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_version_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:source_left_offset), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:source_top_offset), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:source_width), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:source_height), 0)
    end
    
    create_table(:destinations, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :parent_id
      Bignum :lft
      Bignum :rght
      Bignum :child_count, :default=>0, :null=>false
      Bignum :direct_child_count, :default=>0, :null=>false
      Float :latitude
      Float :longitude
      Integer :zoom_level
      String :map_type, :default=>"roadmap", :size=>16, :null=>false
      String :streetview, :size=>255
      String :name, :size=>255, :null=>false
      String :slug, :size=>255
      String :overview, :text=>true
      Bignum :main_image_id
      String :meta_title, :size=>255
      String :meta_description, :text=>true
      String :meta_keywords, :text=>true
      DateTime :created
      DateTime :modified
      Float :map_latitude
      Float :map_longitude
      TrueClass :published, :default=>false, :null=>false
      String :google_tracking, :text=>true
      String :youtube_playlist_id, :size=>16
      Bignum :banner_image_id
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:parent_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:lft), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:rght), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:child_count), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:direct_child_count), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:main_image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:banner_image_id), 0)
      
      index [:slug], :name=>:slug, :unique=>true
    end
    
    create_table(:destinations_images, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :destination_id, :null=>false
      Bignum :image_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:destination_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:destination_id], :name=>:destination_id
      index [:image_id], :name=>:image_id
    end
    
    create_table(:destinations_itineraries, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :destination_id, :null=>false
      Bignum :itinerary_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:destination_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:itinerary_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:destination_id], :name=>:destination_id
      index [:itinerary_id], :name=>:itinerary_id
    end
    
    create_table(:destinations_landing_pages, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :destination_id, :null=>false
      Bignum :landing_page_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:destination_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:landing_page_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:destination_id, :landing_page_id], :name=>:UNIQUE, :unique=>true
      index [:destination_id], :name=>:destination_id
    end
    
    create_table(:destinations_on_holiday_types, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :destination_id, :null=>false
      Bignum :holiday_type_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:destination_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:holiday_type_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:destination_id, :holiday_type_id], :name=>:UNIQUE, :unique=>true
      index [:destination_id], :name=>:destination_id
    end
    
    create_table(:destinations_testimonials) do
      primary_key :id
      Integer :destination_id
      Integer :testimonial_id
      Integer :order
      TrueClass :featured, :default=>false
    end
    
    create_table(:download_folders) do
      primary_key :id, :type=>Bignum
      Bignum :parent_id
      Bignum :lft
      Bignum :rght
      Bignum :child_count, :default=>0, :null=>false
      Bignum :direct_child_count, :default=>0, :null=>false
      Integer :download_count
      String :name, :size=>255, :null=>false
      DateTime :created, :null=>false
      DateTime :modified, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:parent_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:lft), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:rght), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:child_count), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:direct_child_count), 0)
    end
    
    create_table(:downloads) do
      primary_key :id
      Integer :download_folder_id
      String :extension, :size=>4
      String :name, :size=>255
      Integer :size
      DateTime :created
      DateTime :modified
    end
    
    create_table(:faqs) do
      primary_key :id, :type=>Bignum
      String :question, :size=>255, :null=>false
      String :answer, :text=>true, :null=>false
      Bignum :order
      DateTime :created, :null=>false
      DateTime :modified, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
    end
    
    create_table(:groups) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      DateTime :created
      DateTime :modified
    end
    
    create_table(:holiday_types, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      String :slug, :size=>255
      Bignum :image_id
      Integer :banner_image_id
      Bignum :main_image_id
      String :meta_title, :size=>255
      String :meta_description, :text=>true
      String :meta_keywords, :text=>true
      String :summary, :text=>true
      String :overview, :text=>true
      Bignum :order
      DateTime :created
      DateTime :modified
      TrueClass :published, :default=>false, :null=>false
      String :google_tracking, :text=>true
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:main_image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:image_id], :name=>:image_id
    end
    
    create_table(:holiday_types_itineraries, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :holiday_type_id, :null=>false
      Bignum :itinerary_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:holiday_type_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:itinerary_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:holiday_type_id], :name=>:destination_id
      index [:itinerary_id], :name=>:itinerary_id
    end
    
    create_table(:holiday_types_landing_pages, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :holiday_type_id, :null=>false
      Bignum :landing_page_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:holiday_type_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:landing_page_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:landing_page_id, :holiday_type_id], :name=>:UNIQUE, :unique=>true
      index [:landing_page_id], :name=>:landing_page_id
    end
    
    create_table(:holiday_types_on_destinations, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :destination_id, :null=>false
      Bignum :holiday_type_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:destination_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:holiday_type_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:destination_id, :holiday_type_id], :name=>:UNIQUE, :unique=>true
      index [:destination_id], :name=>:destination_id
    end
    
    create_table(:holiday_types_testimonials) do
      primary_key :id
      Integer :holiday_type_id
      Integer :testimonial_id
      Integer :order
      TrueClass :featured, :default=>false
    end
    
    create_table(:image_folders) do
      primary_key :id, :type=>Bignum
      Bignum :parent_id
      Bignum :lft
      Bignum :rght
      Bignum :child_count, :default=>0, :null=>false
      Bignum :direct_child_count, :default=>0, :null=>false
      String :name, :size=>255, :null=>false
      DateTime :created
      DateTime :modified
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:parent_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:lft), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:rght), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:child_count), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:direct_child_count), 0)
    end
    
    create_table(:image_versions) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      String :usage, :size=>255
      String :type, :size=>255
      Bignum :width, :default=>0, :null=>false
      Bignum :height, :default=>0, :null=>false
      TrueClass :force_resize, :default=>false, :null=>false
      DateTime :created, :null=>false
      DateTime :modified, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:width), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:height), 0)
    end
    
    create_table(:images) do
      primary_key :id, :type=>Bignum
      String :alt, :size=>255
      Bignum :image_folder_id
      String :extension, :size=>4, :null=>false
      String :versions, :text=>true
      TrueClass :do_not_resize, :default=>false, :null=>false
      DateTime :created
      DateTime :modified
      TrueClass :published, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_folder_id), 0)
    end
    
    create_table(:images_spotlights, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :image_id
      Bignum :spotlight_id
      Bignum :order
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:spotlight_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:image_id], :name=>:Image
      index [:spotlight_id], :name=>:Spotlight
    end
    
    create_table(:itineraries) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      String :slug, :size=>255
      Bignum :image_id
      String :meta_title, :size=>255
      String :meta_description, :text=>true
      String :meta_keywords, :text=>true
      String :summary, :text=>true
      Float :from_price
      String :map_latitude, :null=>false
      String :map_longitude, :null=>false
      Integer :zoom_level, :default=>0, :null=>false
      String :map_type, :default=>"roadmap", :size=>16, :null=>false
      DateTime :created
      DateTime :modified
      TrueClass :published, :default=>false, :null=>false
      String :google_tracking, :text=>true
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:zoom_level), 0)
    end
    
    create_table(:itineraries_testimonials) do
      primary_key :id
      Integer :itinerary_id
      Integer :testimonial_id
      Integer :order
      TrueClass :featured, :default=>false
    end
    
    create_table(:itinerary_days, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :itinerary_id, :null=>false
      Integer :order, :null=>false
      String :day_number, :size=>255
      String :name, :size=>255
      Bignum :miles
      String :detail, :text=>true
      Bignum :image_id
      String :latitude, :null=>false
      String :longitude, :null=>false
      DateTime :created
      DateTime :modified
      String :location, :size=>255
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:itinerary_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:miles), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      
      index [:itinerary_id], :name=>:itinerary_id
    end
    
    create_table(:landing_pages) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      String :slug, :size=>255
      Integer :main_image_id
      String :meta_title, :size=>255
      String :meta_description, :text=>true
      String :meta_keywords, :text=>true
      String :youtube_playlist_id, :size=>16
      Bignum :order
      String :summary, :text=>true
      DateTime :created
      DateTime :modified
      TrueClass :published, :default=>false, :null=>false
      String :google_tracking, :text=>true
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
    end
    
    create_table(:landing_pages_accommodations, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :accommodation_id, :null=>false
      Bignum :landing_page_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:accommodation_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:landing_page_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:accommodation_id], :name=>:accommodation_id
      index [:landing_page_id], :name=>:destination_id
    end
    
    create_table(:landing_pages_activities, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :activity_id, :null=>false
      Bignum :landing_page_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:activity_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:landing_page_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:activity_id], :name=>:activity_id
      index [:landing_page_id], :name=>:landing_page_id
    end
    
    create_table(:landing_pages_images, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :landing_page_id, :null=>false
      Bignum :image_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:landing_page_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:image_id], :name=>:image_id
      index [:landing_page_id], :name=>:landing_page_id
    end
    
    create_table(:landing_pages_itineraries, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :landing_page_id, :null=>false
      Bignum :itinerary_id, :null=>false
      Bignum :order
      TrueClass :featured, :default=>false, :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:landing_page_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:itinerary_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:itinerary_id], :name=>:itinerary_id
      index [:landing_page_id], :name=>:landing_page_id
    end
    
    create_table(:pages) do
      primary_key :id, :type=>Bignum
      Bignum :parent_id
      Bignum :lft
      Bignum :rght
      Bignum :child_count
      Bignum :direct_child_count
      String :css_class, :size=>255
      String :internal_ref, :size=>255
      String :navigation_label, :size=>255
      Bignum :image_id
      String :slug, :size=>255
      String :meta_title, :size=>255
      String :meta_description, :text=>true
      String :meta_keywords, :text=>true
      DateTime :created
      DateTime :modified
      TrueClass :published, :default=>false, :null=>false
      String :google_tracking, :text=>true
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:parent_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:lft), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:rght), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:child_count), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:direct_child_count), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
    end
    
    create_table(:press_releases) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      String :slug, :size=>255, :null=>false
      Integer :image_id, :null=>false
      String :summary, :text=>true, :null=>false
      Integer :order, :null=>false
      TrueClass :published, :default=>false, :null=>false
      String :google_tracking, :text=>true, :null=>false
      DateTime :created, :null=>false
      DateTime :modified, :null=>false
    end
    
    create_table(:press_releases_images, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :press_release_id, :null=>false
      Bignum :image_id, :null=>false
      Bignum :order
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:press_release_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
      
      index [:image_id], :name=>:image_id
      index [:press_release_id], :name=>:press_release_id
    end
    
    create_table(:quote_requests) do
      primary_key :id, :type=>Bignum
      String :title, :size=>255
      String :firstname, :size=>255
      String :lastname, :size=>255
      String :telephone, :size=>16, :null=>false
      String :email, :size=>255
      Integer :email_optin, :null=>false
      String :preferred_day, :size=>255
      String :preferred_time, :size=>255
      String :house_num_name, :size=>255
      String :address1, :size=>255
      String :address2, :size=>255
      String :address3, :size=>255
      String :postcode, :size=>255
      Integer :brochure, :default=>0, :null=>false
      Integer :news_offers_optin, :default=>0, :null=>false
      Integer :num_adults, :default=>0, :null=>false
      Bignum :num_children
      String :child_age, :size=>255
      String :preferred_date, :size=>255
      String :preferred_duration, :size=>255
      Integer :flexible, :default=>0, :null=>false
      String :airport, :size=>255
      String :destinations, :text=>true
      Integer :suggest, :default=>0, :null=>false
      String :accom_stars, :size=>32
      String :car_size, :size=>255
      String :other_info, :text=>true
      String :how_heard, :size=>255
      String :newspaper, :size=>255
      DateTime :created
      DateTime :modified
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:email_optin), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:num_children), 0)
    end
    
    create_table(:spotlights) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255
      String :slug, :size=>255
      String :from_price, :size=>255
      Bignum :image_id
      Integer :banner_image_id
      String :summary, :text=>true
      String :meta_title, :size=>255
      String :meta_description, :text=>true
      String :meta_keywords, :text=>true
      Bignum :order
      DateTime :created
      DateTime :modified
      String :details, :text=>true
      String :date_and_price_information, :text=>true
      String :dates_and_prices, :text=>true
      TrueClass :published, :default=>false, :null=>false
      String :google_tracking, :text=>true
      Date :expiry_date, :default=>Date.new(2020, 1, 1), :null=>false
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:image_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:order), 0)
    end
    
    create_table(:testimonials) do
      primary_key :id
      String :title, :size=>255
      String :slug, :size=>255
      String :author, :size=>255
      Date :date
      Integer :image_id
      String :meta_title, :size=>255
      String :meta_description, :text=>true
      String :meta_keywords, :text=>true
      String :summary, :text=>true
      String :testimonial, :text=>true
      DateTime :created
      DateTime :modified
      TrueClass :published, :default=>false
      TrueClass :featured, :default=>false
    end
    
    create_table(:users, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      String :email, :size=>255, :null=>false
      String :password, :size=>255
      Bignum :group_id, :null=>false
      DateTime :created
      DateTime :modified
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:group_id), 0)
      
      index [:email], :name=>:email, :unique=>true
    end
    
    create_table(:webadmin_menu) do
      primary_key :id, :type=>Bignum
      Bignum :parent_id
      Bignum :lft
      Bignum :rght
      Bignum :child_count
      Bignum :direct_child_count
      String :text, :size=>255
      Bignum :aco_id
      DateTime :created
      DateTime :modified
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:parent_id), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:lft), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:rght), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:child_count), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:direct_child_count), 0)
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:aco_id), 0)
    end
    
    create_table(:webadmin_user_profiles, :ignore_index_errors=>true) do
      primary_key :id, :type=>Bignum
      Bignum :user_id
      String :name, :size=>255
      DateTime :last_login
      DateTime :created
      DateTime :modified
      
      check Sequel::SQL::BooleanExpression.new(:>=, Sequel::SQL::Identifier.new(:user_id), 0)
      
      index [:user_id], :name=>:user_id, :unique=>true
    end
  end
end
