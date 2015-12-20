class Image < ActiveRecord::Base
    belongs_to :product
   has_attached_file :image, :styles => { :large => "320x240>" }, :path => '/:class/:attachment/:id_partition/:style/:filename', :storage => :s3, :s3_host_name =>  's3-us-west-2.amazonaws.com', :bucket => 'areiro'
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end