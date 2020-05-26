class Report < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :post

  enumerize :reason, in: [ :racism , :homophobia, :hate_speech, :plagiary , :out_of_context, :others ], skip_validations: true
end
